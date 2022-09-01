---
title: Handling Connector Signing
description: How to sign custom connectors for trusted use with recommended security levels
author: ptyx507x
ms.topic: conceptual
ms.date: 12/1/2021
ms.author: miescobar
---

# Handling Power Query Connector Signing 

In Power BI, the loading of custom connectors is limited by your choice of security setting. As a general rule, when the security for loading custom connectors is set to 'Recommended', the custom connectors won't load at all, and you have to lower it to make them load.

The exception to this is trusted, 'signed connectors'. Signed connectors are a special format of custom connector, a .pqx instead of .mez file, which has been signed with a certificate. The signer can provide the user or the user's IT department with a thumbprint of the signature, which can be put into the registry to securely indicate trusting a given connector.

The following steps enable you to use a certificate (with an explanation on how to generate one if you don't have one available) and sign a custom connector with the 'MakePQX' tool.

>[!Note]
> If you need help creating a self-signed certificate to test these instructions, go to the Microsoft documentation on [New-SelfSignedCertificate in PowerShell](/powershell/module/pki/new-selfsignedcertificate).

>[!Note]
> If you need help exporting your certificate as a pfx, go to [Export-PfxCertificate](/powershell/module/pki/export-pfxcertificate).

1. Download [MakePQX](https://aka.ms/makepqx).

2. Extract the MakePQX folder in the included zip to the target you want. 

3. To run it, call MakePQX in the command line. It requires the other libraries in the folder, so you can't copy just the one executable. Running without any parameters will return the help information. 

Usage: **MakePQX [**_options_**] [**_command_**]** 

Options: 

| Options | Description |
|---------|-------------|
|  **-?**  \| **-h** \| **--help** | Show help information |

Commands: 

| Command | Description |
|---------|-------------|
|  **pack** |   Create a pqx file. |
|  **sign** |   Signs an unsigned pqx, or countersigns if pqx is already signed. Use the **--replace** option to replace the existing signature. |
|  **verify** | Verify the signature status on a pqx file. Return value will be non-zero if the signature is invalid. |

 
There are three commands in MakePQX. Use **MakePQX [**_command_**] --help** for more information about a command. 

## Pack 

The **Pack** command takes a mez file and packs it into a pqx file, which can be signed. The pqx file is also able to support some capabilities that will be added in the future.

Usage: **MakePQX pack \[**_options_**\]** 

Options: 

| Option | Description |
|--------|-------------|
|  **-?**  \| **-h** \| **--help** |   Show help information. |
|  **-mz** \| **--mez** |         Input extension file. |
|  **-c**  \| **--certificate** | Certificate (.pfx) used to sign the extension file. |
|  **-p**  \| **--password** |    Password for the certificate file. |
|  **-t**  \| **--target** |      Output file name. Defaults to the same name as the input file. |

### Example 

**C:\Users\cpope\Downloads\MakePQX>MakePQX.exe pack -mz "C:\Users\cpope\OneDrive\Documents\Power BI Desktop\Custom Connectors\HelloWorld.mez" -t "C:\Users\cpope\OneDrive\Documents\Power BI Desktop\Custom Connectors\HelloWorldSigned.pqx"**

## Sign 

The **Sign** command signs your pqx file with a certificate, giving it a thumbprint that can be checked for trust by Power BI clients with the higher security setting. This command takes a pqx file and returns the same pqx file, signed.

Usage: **MakePQX sign \[**_arguments_**\] \[**_options_**\]** 

Arguments: 

| Argument   | Description                |
|------------|----------------------------|
| _\<pqx file\>_ | The path to the pqx file. | 

Options:

| Option | Description |
|--------|-------------|
|  **-c**  \| **--certificate** | Certificate (.pfx) used to sign the extension file. |
| **-p**  \| **--password** |    Password for the certificate file. |
|  **-r** \| **--replace**   |    Replace existing signature instead of countersigning. |
|  **-?**  \| **-h** \| **--help** |   Show help information. |

### Example 

**C:\Users\cpope\Downloads\MakePQX>MakePQX sign "C:\Users\cpope\OneDrive\Documents\Power BI Desktop\Custom Connectors\HelloWorldSigned.pqx" --certificate ContosoTestCertificate.pfx --password password**

## Verify 

The **Verify** command verifies that your module has been properly signed, and is showing the Certificate status.

Usage: **MakePQX verify \[**_arguments_**\] \[**_options_**\]** 

Arguments: 

| Argument   | Description                |
|------------|----------------------------|
| _\<pqx file\>_ | The path to the pqx file. | 

Options: 

| Option             | Description                           |
|--------------------|---------------------------------------|
| **-q** \| **--quiet**      | Hides signature verification output.  |
| **-?** \| **-h** \| **--help** | Show help information.                 |

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

## Trusting signed connectors in Power BI Desktop

Once you’ve verified your signature, you can provide the thumbprint to the end user to list as trusted. You can read about how to provide the thumbprint in the [Power BI Documentation](/power-bi/desktop-trusted-third-party-connectors).