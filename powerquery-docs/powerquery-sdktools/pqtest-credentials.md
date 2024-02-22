---
title: Credentials
description: Understanding credential commands within PQTest
author: ryan-syed
ms.topic: conceptual
ms.date: 02/14/2024
ms.author: v-ryansyed
---

# Credentials

Data source credentials can be cached and reused across commands. By default, this cache is stored in a local file under
%LOCALAPPDATA%/Microsoft/pqtest and [encrypted with the current user key](/dotnet/standard/security/how-to-use-data-protection).

As an alternative to local file storage, you can store credentials in an [Azure Key Vault](/azure/key-vault/). You can enable this option using the **\-\-keyVault** / **-kv** option, providing a key vault name as the option argument, and setting the environment variables specified in the following table:

> [!NOTE]
> When using Azure Key Vault, credentials are stored as a single binary object, rather than individual secrets.

| Variable                   | Details                                                                               | Sample                               |
| -------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------ |
| PQTEST_AZURE_CLIENT_ID     | ID (GUID) for the Microsoft Entra ID application authorized to access your key vault. | c265f4e8-a32f-4548-a21e-3542ec65134a |
| PQTEST_AZURE_CLIENT_SECRET | Client secret for your Microsoft Entra ID application.                                | PLACEHOLDER                          |
| PQTEST_AZURE_TENANT_ID     | ID (GUID) for the tenant that owns the Azure Key Vault.                               | c265f4e8-a32f-4548-a21e-3542ec65134a |
| PQTEST_AZURE_KEY_VAULT_URL | URL to the key vault.                                                                 | `https://<myvault>.vault.azure.net`  |

Example of using the **keyVault** option:

**set PQTEST_AZURE_CLIENT_ID="c265f4e8-a32f-4548-a21e-3542ec65134a"**
**set PQTEST_AZURE_CLIENT_SECRET="PLACEHOLDER"**
**set PQTEST_AZURE_TENANT_ID="c265f4e8-a32f-4548-a21e-3542ec65134a"**
**set PQTEST_AZURE_KEY_VAULT_URL="https://myvault.vault.azure.net"**

**pqtest list-credential \-\-keyVault secretName**

## Credential-template

Use this command to generate a credential template in JSON format that can be passed into the **set-credential** command. The command requires you to provide an [extension](pqtest-general-usage.md#extension) and [data source information](pqtest-general-usage.md#data-source). If the data
source supports more than one authentication kind, you need to specify which authentication kind to use with the **\-\-authenticationKind** / **-ak** option.

The output template has placeholder values identified with a **\$$**\<*key name*>**$$** that should be replaced before passing them to the **set-credential** command.

For example, `MyConnector` supports both Anonymous and UsernamePassword authentication kinds.

To generate an `Anonymous` credential, the following command would be used:

**pqtest credential-template \-\-extension MyConnector.mez \-\-queryFile MyConnectorQuery.m \-\-prettyPrint \-\-authenticationKind Anonymous**

> [!NOTE]
>The output JSON value doesn't contain any placeholder values as the `Anonymous` kind doesn't require any.

```json
{
  "AuthenticationKind": "Anonymous",
  "AuthenticationProperties": {},
  "PrivacySetting": "None",
  "Permissions": []
}
```

The following command would be used to generate a UsernamePassword credential for the same connector:

**pqtest credential-template \-\-extension MyConnector.mez \-\-queryFile MyConnectorQuery.m \-\-prettyPrint \-\-authenticationKind UsernamePassword**

The resulting template contains `$$USERNAME$$` and `$$PASSWORD$$` placeholder values.

```json
{
  "AuthenticationKind": "UsernamePassword",
  "AuthenticationProperties": {
    "Username": "$$USERNAME$$",
    "Password": "$$PASSWORD$$"
  },
  "PrivacySetting": "None",
  "Permissions": []
}
```

## Set-credential

Use this command to store credentials that's used by the **test-connection** and **run-test** commands. The command requires you to provide an [extension](pqtest-general-usage.md#extension) and [data source information](pqtest-general-usage.md#data-source). Credentials can be set in one of three ways:

* Using a credential in JSON format.
* Automatic credential for authentication kinds that don't require additional settings (`Anonymous` and `Windows`).
* Using the interactive mode.

### Credentials in JSON format

Any credential kind can be set using the JSON credential format. Use the [credential-template command](#credential-template) to generate the credential JSON.

When setting a credential using the JSON template, the input must be piped into the command, or provided from `stdin` via a file.

Here's an example of setting an `Anonymous` credential by piping the result of the **credential-template** command into **set-credential**:

**pqtest credential-template -e MyConnector.mez -q MyConnectorQuery.m -p -ak Anonymous | pqtest set-credential -e MyConnector.mez -q MyConnectorQuery.m -p**

```json
{
  "Details": {
    "Kind": "MyConnector",
    "Path": "MyConnector",
    "NormalizedPath": "MyConnector",
    "IsDefaultForKind": false
  },
  "Message": "Successfully set credential",
  "Status": "Success"
}
```

> [!NOTE]
>`Anonymous` and `Windows` credentials can be set using [automatic credentials](#automatic-credentials).

Here's an example of setting a credential from a file stored on disk (using redirected input):

**pqtest set-credential -e MyConnector.mez -q MyConnectorQuery.m -p < mySavedCredential.json**

```json
{
  "Details": {
    "Kind": "MyConnector",
    "Path": "MyConnector",
    "NormalizedPath": "MyConnector",
    "IsDefaultForKind": false
  },
  "Message": "Successfully set credential",
  "Status": "Success"
}
```

### Automatic credentials

You can set `Anonymous` and `Windows` credentials without providing a [credential template](#credential-template).

> [!NOTE]
>`Windows` credentials set in this way default to using the current user's identity. Use the [credential-template command](#credential-template) to generate a JSON credential that can be modified to use an alternative windows account credentials.

**pqtest set-credential -e MyConnector.mez -q MyConnectorQuery.m -p \-\-authenticationKind windows**

**pqtest set-credential -e MyConnector.mez -q MyConnectorQuery.m -p \-\-authenticationKind anonymous**

### Interactive mode

Credentials can be set using the interactive mode using the **--interactive** command line option.

The interactive mode can be used for the `OAuth` and `Aad` authentication kinds. Running the command in this mode presents an
OAuth dialog that can be used to test your OAuth implementation.

Interactive OAuth flows use the WebView2 (Microsoft Edge Chromium) browser component, which might need to be installed separately.
More details can be found in the [Power Query OAuth documentation for Power BI Desktop](/power-query/oauth-edge-chromium).

The **--useLegacyBrowser** option can be used to force an IE11 embedded browser window.
