---
title: Adding your tests
description: Adding tests to verify your extension connector and understanding various options while working with the test framework
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Testing Framework part 7 - Adding your tests and understanding various options

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be done sequentially&mdash; to ensure that your environment is setup for testing your custom connector.

Now you might want to add more tests for your extension connector to verify other use cases or the standardized test suite doesn't fit your needs.

In this lesson, you will:

> [!div class="checklist"]
> * Creating tests for your connector
> * Running tests with various configurations and options

## Creating custom tests

[TODO: pqtest.md link]

If you wish to add any tests specific to the connector then you can add them to the *DatasourceSpecific* folder. You could also choose to extend the tests in Sanity/Standard Tests folder. Create a PQ file and place it in any directory of the tests directory. Run the test first time to generate the PQOut output file. Subsequent runs will validate the output generated with the PQOut output file. Please review the documentation in [pqtest.md](https://dev.azure.com/powerbi/Power%20Query/_git/DataConnectors?path=/PowerQuerySDKTestFramework/docs/PowerQuerySdkTools/Tools/PQTest/pqtest.md&_a=preview&version=GBmaster) in the DataConnectors repo for more information on using the compare command.

## Reference for various configurations and options

[TODO: pqtest.md link]

You can refer []() for various options and examples while running the compare command.

## Conclusion

This lesson showed how and where to add more tests for your connector. You also have a reference for various configurations and options used by the compare command.

In the next lesson, you'll learn to automate running of the tests by setting up a pipeline with the tests using the test framework.

## Next steps

[Power Query SDK Testing Framework part 8 - Pipeline Guide](../9-pipeline/readme.md)
