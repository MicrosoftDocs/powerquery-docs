---
title: Testing your extension connector
description: Test your extension connector using the provided Test Suite
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Testing Framework part 6 - Testing your extension connector

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be done sequentially—to ensure that your environment is set up for testing your custom connector.

So far, you're done with the following steps:
* Set up the environment
* Uploaded the test data
* Set up the test suite, and
* Are familiar with various file formats and their functionality

You're finally ready to start verifying your extension connector with the test suite.

In this lesson, you will:

> [!div class="checklist"]
>
> * Learn how to update the parameter queries and the settings files
> * Set the path for the test framework, connector extension and test setting directory
> * Set credentials for the extension
> * Validate the test data by running sanity tests
> * Validate your connector by running the standardized set of tests
> * Validate query folding and generate command text in diagnostic files

## Update parameter queries and settings file with the details specific to your data source extension

To create the parameter queries for your data source perform the following steps:

[TODO: Update the path in cloned repo folder]

* Navigate to the folder under the cloned repo folder: `PowerQuerySDKTestFramework\tests\TestSuites\ParameterQueries`
* Make a copy of the "generic" folder and rename it to the extension name
* Open each file under that folder and update the M queries as the instructions provided in the file

To create the setting files for your data source perform the following steps:

[TODO: Update the path in cloned repo folder]

* Navigate to the folder under the cloned repo folder: `PowerQuerySDKTestFramework\tests\TestSuites\Settings`
* Make a copy of the generic folder
* Open each file under the generic folder and update the settings file to point to the correct parameter queries folder

## Set the PQTest.exe, Extension and TestSettingsDirectory variables

[TODO: Update the path of TestSuite]

* Open a PowerShell window, navigate to the `PowerQuerySDKTestFramework\tests\TestSuite` folder in cloned repo folder and set the following variables:

[TODO: Update the following system paths close to what the users might expect to see]

  ```PowerShell
  // Set variables for PQTest.exe, Extension and TestSettingsDirectory paths
  $PQTestExe = "<Replace with path to PQTest.exe>"
  $Extension = "<Replace with path to the extension mez/pqx file>"
  $TestSettingsDirectory =  "<Replace with Path to to folder containing the Test Settings>"

  Example:
  PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> $PQTestExe = "C:\dev\PowerQuerySdkTools\out\AnyCPU\Debug\PQTest\PQTest.exe"
  PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> $Extension = "C:\dev\DataConnectors\bin\AnyCPU\Release\mez\NonCertified\Snowflake.pqx"
  PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> $TestSettingsDirectory = "C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites\Settings\Snowflake"
  ```

> [!NOTE]
> It is highly recommended to set the above PowerShell variables to follow along this guide easily. However, you can run the tests without setting this up.

## Set the Credentials for your Extension

[TODO: Update the path for credential template reference and add a link to pqtest.md]

* Use this `credential-template` command to generate a credential template in json format for your connector that can be passed into the `set-credential` command. Refer the [credential-template](https://dev.azure.com/powerbi/Power%20Query/_git/PowerQuerySdkTools?path=/Tools/PQTest/pqtest.md&_a=preview&version=GBmain&anchor=credential-template) section in the pqtest.md file on the usage to set up the credentials for your connector.

[TODO: Update the following system paths close to what the users might expect to see]

```PowerShell
& $PQTestExe credential-template -e $Extension -q "<Replace with path to any parameter query file>" --prettyPrint --authenticationKind UsernamePassword

Example:
& $PQTestExe credential-template -e $Extension -q "C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites\ParameterQueries\snowflake\Taxi.parameterquery.pq" --prettyPrint --authenticationKind UsernamePassword
```

Take the output from the above command and replace the Username and Password values with correct credentials and save it as json file (Ex: snowflake_cred.json).

[TODO: Update the path for set-credential reference and add a link to pqtest.md]

* Use the `set-credential` command to store credentials that the `compare` command needs to run the tests.
* Using the existing PowerShell window, set the credentials for your extension using the json credential file generated in the previous step. Refer the [set-credential](https://dev.azure.com/powerbi/Power%20Query/_git/PowerQuerySdkTools?path=/Tools/PQTest/pqtest.md&_a=preview&version=GBmain&anchor=set-credential) section in pqtest.md file on the usage to set up the credentials for your connector.

[TODO: Update the following system paths close to what the users might expect to see]

```PowerShell
Get-Content "<Replace with path to the json credential file>" | & $PQTestExe set-credential -e "$Extension" -q "<Replace with the path to any parameter query file>

Example:
Get-Content "C:\dev\Misc\snowflake_cred.json" | & $PQTestExe set-credential -p -e "$Extension" -q "C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites\ParameterQueries\snowflake\Taxi.parameterquery.pq"

```

## Validate the test data is set up correctly by running the Sanity Tests

To ensure that the changes are working and the data setup is done correctly, run Sanity Tests as follows:

* Run the Sanity Tests using the following commands:

[TODO: Update the following system paths close to what the users might expect to see]

```PowerShell
# Run the Sanity Tests
.\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension  -TestSettingsDirectory $TestSettingsDirectory -TestSettingsList SanityAllTypesSettings.json
.\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension  -TestSettingsDirectory $TestSettingsDirectory -TestSettingsList SanityAllTypesZoneSettings.json

Example:
PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> .\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension  -TestSettingsDirectory $TestSettingsDirectory -TestSettingsList SanityAllTypesSettings.json

# Output
-----------------------------------------------------------------------------
PQ SDK Test Framework - Test Execution - Test Results Summary: Snowflake.pqx
-----------------------------------------------------------------------------

TestFolder TestName                OutputStatus TestStatus Duration
---------- --------                ------------ ---------- --------
Taxi       AllTypes.query.pq       Passed       Passed     00:00:04.1497406
Taxi       AllTypesSchema.query.pq Passed       Passed     00:00:00.7242078

-----------------------------------------------------------------------------
Total Tests: 2 Passed: 2 Failed: 0 Total Duration: 00d:00h:00m:06s
-----------------------------------------------------------------------------

PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> .\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension  -TestSettingsDirectory $TestSettingsDirectory -TestSettingsList SanityAllTypesZoneSettings.json

# Output
-----------------------------------------------------------------------------
PQ SDK Test Framework - Test Execution - Test Results Summary: Snowflake.pqx
-----------------------------------------------------------------------------

TestFolder TestName                    OutputStatus TestStatus Duration
---------- --------                    ------------ ---------- --------
Zone       AllTypesZone.query.pq       Passed       Passed     00:00:04.1553549
Zone       AllTypesZoneSchema.query.pq Passed       Passed     00:00:00.5657591

-----------------------------------------------------------------------------
Total Tests: 2 Passed: 2 Failed: 0 Total Duration: 00d:00h:00m:06s
-----------------------------------------------------------------------------
```

## Run the Sanity & Standard Tests

### Run using RunPQSDKTestSuites.ps1 utility

[TODO: Update the path of TestSuite]

To run all the Sanity & Standard Tests or a set of tests defined by settings file, use the `RunPQSDKTestSuites.ps1` utility present in the `PowerQuerySDKTestFramework\tests\TestSuites` directory. Using the same PowerShell window, run the following command to execute the tests.

```PowerShell
# Run all the Sanity & Standard Tests
.\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension -TestSettingsDirectory $TestSettingsDirectory

Example:
PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> .\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension  -TestSettingsDirectory $TestSettingsDirectory
```

To know more about the RunPQSDKTestSuites.ps1 utility, run the Get-Help command as follows:

[TODO: Update the following system paths close to what the users might expect to see]

```PowerShell
Get-help .\RunPQSDKTestSuites.ps1
Example:
PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> Get-help .\RunPQSDKTestSuites.ps
```

### Run using the PQTest.exe

Use the following command in the same PowerShell window to run a particular tests directly using PQTest.exe:

[TODO: Update the following system paths close to what the users might expect to see]

```PowerShell
$PQTestExe compare -p -e $Extension -pa <Replace with path to the parameter query> -q <Replace with the the path to test query>

Example:
& $PQTestExe compare -p -e "$Extension" -pa "C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites\ParameterQueries\snowflake\Taxi.parameterquery.pq" -q "C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites\Standard\Datatypes\Cast.query.pq"

```

[TODO: Update the path of command reference]

Review the documentation in [pqtest.md](https://dev.azure.com/powerbi/Power%20Query/_git/DataConnectors?path=/PowerQuerySDKTestFramework/docs/PowerQuerySdkTools/Tools/PQTest/pqtest.md&_a=preview&version=GBmaster) in the DataConnectors repo for more information on running tests with PQTest.exe.

## Running query folding tests

The tests under any Sanity & Standard Tests can be run to validate the query folding. Run the test first time to generate diagnostics output files. Subsequent runs validate the command text output generated with the diagnostics output file.

### Run query folding tests using RunPQSDKTestSuites.ps1 utility

[TODO: Update the following system paths close to what the users might expect to see]

```PowerShell
// Validate Query folding the Sanity & Standard Tests
.\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension  -TestSettingsDirectory $TestSettingsDirectory -ValidateQueryFolding

Example:
PS C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites> .\RunPQSDKTestSuites.ps1 -PQTestExe $PQTestExe -Extension $Extension  -TestSettingsDirectory $TestSettingsDirectory -ValidateQueryFolding
```

### Run query folding tests using the PQTest.exe

[TODO: Update the following system paths close to what the users might expect to see]

```PowerShell
$PQTestExe compare -p -e $Extension -pa <Replace with path to the parameter query> -q <Replace with the the path to test query> -dc "Odbc"

Example:
& $PQTestExe compare -p -e "$Extension" -pa "C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites\ParameterQueries\snowflake\Taxi.parameterquery.pq" -q "C:\dev\DataConnectors\PowerQuerySDKTestFramework\tests\TestSuites\Standard\Datatypes\Cast.query.pq" -dc "odbc"

```

## Conclusion

This lesson covered the steps to set up the parameter queries and settings files, which are then required to validate your extension connector by running the sanity and standardized set of tests.

In the next lesson, you'll understand how to add more tests. You'll also learn more about the various commands and options available within the test framework and various customizable settings for your testing needs.

## Next steps

[Power Query SDK Testing Framework part 7 - Adding your tests and understanding various options](../7-adding/readme.md)
