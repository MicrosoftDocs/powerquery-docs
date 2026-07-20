---
title: Handling Connector Signing
description: How to sign custom connectors for trusted use with recommended security levels
author: ptyx507x
ms.topic: concept-article
ms.date: 07/17/2026
ms.author: miescobar
ms.subservice: custom-connectors
ai-usage: ai-assisted
---

# Handling Power Query connector signing

In Power BI, your choice of security setting limits the loading of custom connectors. As a general rule, when you set the security for loading custom connectors to **Recommended**, the custom connectors don't load. You need to lower the security setting to load them.

The exception to this rule is trusted, **signed connectors**. Signed connectors are a special format of custom connector, a .pqx file instead of a .mez file, that you sign with a certificate. The signer can provide the user or the user's IT department with a thumbprint of the signature, which they can add to the registry to securely indicate trusting a given connector.

The following steps explain how to use a certificate (with an explanation on how to generate one if you don't have one available) and sign a custom connector by using the **MakePQX** tool.

> [!NOTE]  
> For help creating a self-signed certificate to test these instructions, see [New-SelfSignedCertificate in PowerShell](/powershell/module/pki/new-selfsignedcertificate).
> 
> For help exporting your certificate as a pfx, see [Export-PfxCertificate](/powershell/module/pki/export-pfxcertificate).

## Install and run MakePQX

1. Install the [Microsoft.PowerQuery.SdkTools NuGet package](https://www.nuget.org/packages/Microsoft.PowerQuery.SdkTools/). The package contains `MakePQX.exe` and the other command-line utilities used with the Power Query SDK. To download the package as a standalone folder, use the [NuGet CLI](/nuget/reference/nuget-exe-cli-reference):

   ```console
   nuget install Microsoft.PowerQuery.SdkTools -OutputDirectory <folder>
   ```

   Replace `<folder>` with the directory where you want the package extracted. If you use the [Power Query SDK for Visual Studio Code](power-query-sdk-vs-code.md), these tools are installed with the extension.

1. Locate `MakePQX.exe` inside the extracted package. By default, it's at `<folder>\Microsoft.PowerQuery.SdkTools.<version>\tools\MakePQX.exe`.

1. Run `MakePQX` from that `tools` directory in a command prompt. `MakePQX.exe` depends on the other libraries in the folder, so run it in place rather than copying only the executable. Running the command with no parameters returns the help information.

## MakePQX command overview

Usage: **MakePQX [**_options_**] [**_command_**]**

Options:

| Options | Description |
| --- | --- |
| **-?** \| **-h** \| **--help** | Show help information |

Commands:

| Command | Description |
| --- | --- |
| **pack** | Create a pqx file. |
| **sign** | Signs an unsigned pqx, or countersigns if pqx is already signed. Use the **--replace** option to replace the existing signature. |
| **verify** | Verify the signature status on a pqx file. Return value is non-zero if the signature is invalid. |

MakePQX has three commands. Use **MakePQX [**_command_**] --help** to get more information about a command.

## Pack

The **Pack** command takes a mez file and packs it into a pqx file, which you can sign. The pqx file can also support some capabilities that Microsoft adds in the future.

Usage: **MakePQX pack \[**_options_**\]**

Options:

| Option | Description |
| --- | --- |
| **-?** \| **-h** \| **--help** | Shows help information. |
| **-mz** \| **--mez** | Input extension file. |
| **-c** \| **--certificate** | Certificate (.pfx) used to sign the extension file. |
| **-p** \| **--password** | Password for the certificate file. |
| **-t** \| **--target** | Output file name. Defaults to the same name as the input file. |

### Example

**C:\Users\cpope\Downloads\MakePQX>MakePQX.exe pack -mz "C:\Users\cpope\OneDrive\Documents\Power BI Desktop\Custom Connectors\HelloWorld.mez" -t "C:\Users\cpope\OneDrive\Documents\Power BI Desktop\Custom Connectors\HelloWorldSigned.pqx"**

## Sign

The **Sign** command signs your pqx file with a certificate, giving it a thumbprint that Power BI clients can check for trust when using the higher security setting. This command takes a pqx file and returns the same pqx file, signed.

Usage: **MakePQX sign \[**_arguments_**\] \[**_options_**\]**

Arguments:

| Argument | Description |
| --- | --- |
| _\<pqx file\>_ | The path to the pqx file. |

Options:

| Option | Description |
| --- | --- |
| **-c** \| **--certificate** | Certificate (.pfx) used to sign the extension file. |
| **-p** \| **--password** | Password for the certificate file. |
| **-r** \| **--replace** | Replace existing signature instead of countersigning. |
| **-?** \| **-h** \| **--help** | Shows help information. |

### Example

**C:\Users\cpope\Downloads\MakePQX>MakePQX sign "C:\Users\cpope\OneDrive\Documents\Power BI Desktop\Custom Connectors\HelloWorldSigned.pqx" --certificate ContosoTestCertificate.pfx --password password**

## Verify

The **Verify** command checks that your module is properly signed and shows the certificate status.

Usage: **MakePQX verify \[**_arguments_**\] \[**_options_**\]**

Arguments:

| Argument | Description |
| --- | --- |
| _\<pqx file\>_ | The path to the pqx file. |

Options:

| Option | Description |
| --- | --- |
| **-q** \| **--quiet** | Hides signature verification output. |
| **-?** \| **-h** \| **--help** | Shows help information. |

### Example

**C:\Users\cpope\Downloads\MakePQX>MakePQX verify "C:\Users\cpope\OneDrive\Documents\Power BI Desktop\Custom Connectors\HelloWorldSigned.pqx"**

```
{
  "SignatureStatus": "Success",
  "CertificateStatus": [
    {
      "Issuer": "CN=Colin Popell",
      "Thumbprint": "16AF59E4BE5384CD860E230ED4AED474C2A3BC69",
      "Subject": "CN=Colin Popell",
      "NotBefore": "2019-02-14T22:47:42-08:00",
      "NotAfter": "2020-02-14T23:07:42-08:00",
      "Valid": false,
      "Parent": null,
      "Status": "UntrustedRoot"
    }
  ]
}
```

<a id="trusting-signed-connectors-in-power-bi-desktop"></a>

## Trust signed connectors in Power BI Desktop

After you verify your signature, give the thumbprint to the end user to add to their trusted list. For more information about how to provide the thumbprint, see [Power BI Documentation](/power-bi/desktop-trusted-third-party-connectors).
