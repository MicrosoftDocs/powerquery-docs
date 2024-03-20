---
title: Testing your extension connector
description: Test your extension connector using the provided test suite in the Power Query SDK test framework.
author: ryan-syed
ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
---

# Power Query SDK test framework part 5 - Testing your extension connector

This multi-part reference covers the set-up and running of a standard suite of tests for Power Query connector developers. This reference is meant to be done sequentially to ensure that your environment is set-up for testing your custom connector.

So far, you completed the following steps:

* set-up the environment
* Uploaded the test data
* Downloaded the test suite
* Learned various file formats and their functionality

You're finally ready to start verifying your extension connector with the test suite.

In this section, you:

> [!div class="checklist"]
>
> * Learn how to update the parameter queries and the settings files
> * Set the path for the test framework, connector extension, and test setting directory
> * Set credentials for the extension
> * Validate the test data by running sanity tests
> * Validate your connector by running the standardized set of tests
> * Validate query folding and generate command text in diagnostic files

## Set the PQTest.exe and extension paths in the RunPQSDKTestSuitesSettings.json file

Navigate to \testframework\tests and open the RunPQSDKTestSuitesSettings.json file in the cloned repo folder. Then set the paths for PQTest.exe and the extension in the config file:

* **PQTestExePath**: Replace with the path to PQTest.ext. For example, C:\\Users\\\<*UserName*>\\.vscode\\extensions\\powerquery.vscode-powerquery-sdk-*x.x.x*-win32-x64\\.nuget\\Microsoft.PowerQuery.SdkTools.*x.xxx.x*\\tools\\PQTest.exe, where \<*Username*> is the name of your user profile folder, *x.x.x* is the current version of Power Query SDK extension, and *x.xxx.x* is the current version of Power Query SDK tools.
* **ExtensionPath**: Replace with the path to the extension mez file. For example, C:\\dev\\\<*ConnectorName*>\\\<*ConnectorName*>.mez, where \<*ConnectorName*> is the name of your connector.

> [!NOTE]
> You can find further information about all the variables that you can set in the RunPQSDKTestSuitesSettings.json file in the provided \testframework\tests\RunPQSDKTestSuitesSettingsTemplate.json template.

## Update parameter queries and settings file with the details specific to your data source extension connector

Running the PowerShell script .\RunPQSDKTestSuites.ps1 creates the parameter queries and test settings by creating a folder with \<*Extension Name*>, and the Settings and ParameterQueries folders under it as follows:

* testframework\\tests\\ConnectorConfigs\\\<Extension Name>\\ParameterQueries
* testframework\\tests\\ConnectorConfigs\\\<Extension Name>\\Settings

The following examples show what the paths for a connector named Contoso would look like:

* testframework\\tests\\TestSuites\\Contoso\\ParameterQueries
* testframework\\tests\\TestSuites\\Contoso\\Settings

> [!NOTE]
> Update the M query in the generated parameter query file(s) to connect with your data source and retrieve the previously uploaded NycTaxiGreen & TaxiZoneLookup tables.

Alternatively, to manually create the parameter query files and settings files for your data source, perform the below steps:

1. Navigate to the \testframework\tests\ConnectorConfigs folder under the cloned repo folder.
2. Make a copy of the \generic folder and rename it to the extension name.
3. Open each file in the \ParameterQueries folder and update the M query as the instructions provided in those files.
4. Open each file in the \Settings folder and update those files to point to the correct parameter query file.

## Set the credentials for your extension connector

Ensure the credentials are set-up for your connector following the instructions for the [set-credential](/power-query/sdk-tools/pqtest-credentials) command.

Alternatively, use the **credential-template** command to generate a credential template in JSON format for your connector that can be passed into the **set-credential** command. Refer the [credential-template](/power-query/sdk-tools/pqtest-credentials#credential-template) section on the usage to generate a credential template.

```PowerShell
# <Path to PQTest.exe>.\PQTest.exe credential-template -e <Path to Extension.exe> -q "<Replace with path to any parameter query file>" --prettyPrint --authenticationKind <Specify the authentication kind (Anonymous, UsernamePassword, Key, Windows, OAuth2)>
# Example:
C:\Users\ContosoUser\.vscode\extensions\powerquery.vscode-powerquery-sdk-0.2.3-win32-x64\.nuget\Microsoft.PowerQuery.SdkTools.2.126.3\tools\PQTest.exe credential-template -e "C:\dev\Contoso\Contoso.mez" -q "C:\dev\DataConnectors\testframework\tests\TestSuites\ParameterQueries\Contoso\Contoso.parameterquery.pq" --prettyPrint --authenticationKind UsernamePassword
```

Take the output from the previous command and replace the placeholder values with correct credentials and save it as a JSON file (for example, contoso_cred.json).

Then, use this **set-credential** command to store credentials that are used by the **compare** command to run the tests. Using the existing PowerShell window, set the credentials for your extension using the JSON credential file generated in the previous step. Refer the [set-credential](/power-query/sdk-tools/pqtest-credentials#set-credential) section on the usage to set-up the credentials for your connector.

```PowerShell
$PQTestExe = "C:\Users\ContosoUser\.vscode\extensions\powerquery.vscode-powerquery-sdk-x.x.x-win32-x64\.nuget\Microsoft.PowerQuery.SdkTools.x.xxx.x\tools\PQTest.exe"
$Extension = "C:\dev\Contoso\Contoso.mez"
# Get-Content "<Replace with path to the json credential file>" | & $PQTestExe set-credential -e $Extension -q "<Replace with the path to any parameter query file>"
# Example:
Get-Content "C:\dev\Misc\contoso_cred.json" | & C:\Users\ContosoUser\.vscode\extensions\powerquery.vscode-powerquery-sdk-0.2.3-win32-x64\.nuget\Microsoft.PowerQuery.SdkTools.2.126.3\tools\PQTest.exe  set-credential -p -e "C:\dev\Contoso\Contoso.mez" -q "C:\dev\DataConnectors\testframework\tests\TestSuites\Contoso\ParameterQueries\Contoso.parameterquery.pq"
```

## Validate the test data is set-up correctly by running the sanity tests

To ensure that the changes are working and the data set-up is done correctly, run the sanity tests using the RunPQSDKTestSuites.ps1 utility present in the \testframework\tests\TestSuites directory as follows:

```PowerShell
.\RunPQSDKTestSuites.ps1 -TestSettingsList SanitySettings.json
<#
Example:
PS C:\dev\DataConnectors\testframework\tests\TestSuites> .\RunPQSDKTestSuites.ps1 -TestSettingsList SanitySettings.json

Output:
----------------------------------------------------------------------------------------------
PQ SDK Test Framework - Test Execution - Test Results Summary for Extension: Contoso.pqx
----------------------------------------------------------------------------------------------
TestFolder  TestName                        OutputStatus TestStatus Duration
----------  --------                        ------------ ---------- --------
Sanity\Taxi AllTypes.query.pq               Passed       Passed     00:00:00.0227976
Sanity\Taxi AllTypesRowCount.query.pq       Passed       Passed     00:00:00.0001734
Sanity\Taxi AllTypesSchema.query.pq         Passed       Passed     00:00:00.0001085
Sanity\Zone AllTypesZone.query.pq           Passed       Passed     00:00:00.0010058
Sanity\Zone AllTypesZoneRowCount.query.pq   Passed       Passed     00:00:00.0001786
Sanity\Zone AllTypesZoneSchema.query.pq     Passed       Passed     00:00:00.0000920
----------------------------------------------------------------------------------------------
Total Tests: 6 | Passed: 6 | Failed: 0 | Total Duration: 00d:00h:00m:01s
----------------------------------------------------------------------------------------------
#>
```

## Run the sanity and standard tests

### Run using the RunPQSDKTestSuites.ps1 utility

To run all the sanity and standard tests or a set of tests defined by the settings file, run the following command to execute the tests:

```PowerShell
# Run all the Sanity & Standard Tests
.\RunPQSDKTestSuites.ps1
# Example:
# PS C:\dev\DataConnectors\testframework\tests\TestSuites> .\RunPQSDKTestSuites.ps1
```

To learn more about the RunPQSDKTestSuites.ps1 utility, run the **Get-Help** command as follows:

```PowerShell
Get-Help .\RunPQSDKTestSuites.ps1
# Example:
# PS C:\dev\DataConnectors\testframework\tests\TestSuites> Get-Help .\RunPQSDKTestSuites.ps1 -Detailed
```

### Run using PQTest.exe

Use the following command in the same PowerShell window to run particular tests directly using PQTest.exe:

```PowerShell
# <Path to PQTest.exe>PQTest.exe compare -p -e $Extension -pa <Replace with path to the parameter query> -q <Replace with the the path to test query>
# Example:
 C:\Users\ContosoUser\.vscode\extensions\powerquery.vscode-powerquery-sdk-0.2.3-win32-x64\.nuget\Microsoft.PowerQuery.SdkTools.2.114.4\tools\PQTest.exe compare -p -e "$Extension" -pa "C:\dev\DataConnectors\testframework\tests\TestSuites\Contoso\ParameterQueries\Contoso.parameterquery.pq" -q "C:\dev\DataConnectors\testframework\tests\TestSuites\Standard\Datatypes\Cast.query.pq"
```

Review the documentation in [pqtest-overview](../sdk-tools/pqtest-overview.md) for more information on running tests with PQTest.exe.

## Running query folding tests

The tests under any sanity and standard tests can be run to validate query folding. Run the test the first time to generate a diagnostics output file under the \testframework\tests\\<*Extension Name*>\Diagnostics\ folder. Subsequent runs validate the output generated with the diagnostics output file.

### Run query folding tests using the RunPQSDKTestSuites.ps1 utility

Validate Query folding for the Sanity & Standard Tests as follows:

```PowerShell
.\RunPQSDKTestSuites.ps1 -ValidateQueryFolding
# Example:
# PS C:\dev\DataConnectors\testframework\tests\TestSuites> .\RunPQSDKTestSuites.ps1 -ValidateQueryFolding
```

> [!NOTE]
> Alternatively, specify `ValidateQueryFolding=True` in the \testframework\tests\TestSuite\RunPQSDKTestSuitesSettings.json file.

### Run query folding tests using PQTest.exe

```PowerShell
# <Path to PQText.exe> compare -p -e $Extension -pa <Replace with path to the parameter query> -q <Replace with the the path to test query> -dfp <Replace with path to the diagnostic output file>
# Example:
 C:\Users\ContosoUser\.vscode\extensions\powerquery.vscode-powerquery-sdk-0.2.3-win32-x64\.nuget\Microsoft.PowerQuery.SdkTools.2.114.4\tools\PQTest.exe compare -p -e "$Extension" -pa "C:\dev\DataConnectors\testframework\tests\TestSuites\ParameterQueries\Contoso\Contoso.parameterquery.pq" -q "C:\dev\DataConnectors\testframework\tests\TestSuites\Standard\Datatypes\Cast.query.pq" -dfp "C:\dev\DataConnectors\testframework\tests\TestSuites\Contoso\Diagnostics"
```

## Conclusion

This section covered the steps to set-up the parameter queries and settings files, which are then required to validate your extension connector by running the sanity and standardized set of tests.

In the next section, you learn how to add more tests. You also learn about the various commands and options available within the test framework, and various customizable settings for your testing needs.

## Next steps

[Power Query SDK test framework part 6 - Adding your tests and understanding various options](./6-adding.md)
