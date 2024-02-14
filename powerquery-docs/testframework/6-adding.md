---
title: Adding your tests
description: Adding tests to verify your extension connector and understanding various options while working with the test framework
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Test Framework part 6 - Adding your tests and understanding various options

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be done sequentially—to ensure that your environment is set up for testing your custom connector.

Now you might want to add more tests for your extension connector to verify other use cases or the standardized test suite doesn't fit your needs.

In this lesson, you will:

> [!div class="checklist"]
>
> * Creating tests for your connector
> * Running tests with various configurations and options

## Creating custom tests

[TODO: Figure out path for pqtest.md]

The instructions for adding custom tests are as follows:

* Create a `Custom` folder under `testframework\tests\TesSuites`.
* Create a PQ file with the M Query that needs to be tested and place it in the `Custom` directory.
* Create a settings file `CustomSettings.json` under `testframework\tests\ConnectorConfigs\<Connector Name>\Settings` folder. Add the paths for test folder `"QueryFilePath": "TestSuites/Custom"` and the parameter query file `"ParameterQueryFilePath": "ParameterQueries/<Connector Name>/<Connector Name>.parameterquery.pq"` in it.
* Run the test first time to generate the PQOut output file.
* Subsequent runs validate the output generated with the PQOut output file.
* Review the documentation in [pqtest.md](https://dev.azure.com/powerbi/Power%20Query/_git/DataConnectors?path=/PowerQuerySDKTestFramework/docs/PowerQuerySdkTools/Tools/PQTest/pqtest.md&_a=preview&version=GBmaster) in the DataConnectors repo for more information on creating new tests using the compare command.

## Reference for various configurations and options

[TODO: pqtest.md link]

You can refer [pqtest.md](TBD) for various options and examples while running the compare command.

## Conclusion

This lesson showed how and where to add more tests for your connector. You also have a reference for various configurations and options used by the compare command.

In the next lesson, you'll learn to automate running of the tests by setting up a pipeline with the tests using the test framework.

## Next steps

[Power Query SDK Test Framework part 7 - Pipeline Guide](./7-pipeline.md)
