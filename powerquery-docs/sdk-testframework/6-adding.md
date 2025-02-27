---
title: Adding your tests
description: Adding tests to verify your extension connector and understanding various options while working with the Power Query SDK test framework
author: ryan-syed
ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.subservice: custom-connectors
---

# Power Query SDK test framework part 6 - Adding your tests and understanding various options

This multi-part reference covers the set up and running of a standard suite of tests for Power Query connector developers. The reference is meant to be done sequentially to ensure that your environment is set up for testing your custom connector.

Now you might want to add more tests for your extension connector to verify other use cases or the standardized test suite doesn't fit your needs.

In this section, you:

> [!div class="checklist"]
>
> * Create tests for your connector
> * Run tests with various configurations and options

## Creating custom tests

The following instructions show how to add custom tests:

1. Create a \Custom folder under \testframework\tests\TesSuites.
2. Create a PQ file with the M query that needs to be tested and place it in the \Custom directory.
3. Create a CustomSettings.json settings file under the \testframework\tests\ConnectorConfigs\<Connector Name>\Settings folder. Add the paths for the test folder (for example `"QueryFilePath": "TestSuites/Custom"`) and the parameter query file (for example, `"ParameterQueryFilePath": "ParameterQueries/<Connector Name>/<Connector Name>.parameterquery.pq"` in the settings file.
4. Run the test for the first time to generate the PQOut output file.
5. Subsequent runs validate the output generated with the PQOut output file.

## Reference for various configurations and options

You can refer to [pqtest-compare](../sdk-tools/pqtest-compare.md) for various options and examples while running the **compare** command.

## Conclusion

This section showed how and where to add more tests for your connector. You also have a reference for various configurations and options used by the **compare** command.

In the next section, you learn to automate running of the tests by setting up a pipeline with the tests using the test framework.

## Next steps

[Power Query SDK test framework part 7 - Pipeline guide](./7-pipeline.md)
