---
title: Getting the test suite
description: Overview of the test suite for the Power Query SDK test framework.
author: ryan-syed
ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.subservice: custom-connectors
---

# Power Query SDK test framework part 3 - Test suite

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be followed sequentially to ensure that your environment is set up for testing your extension connector.

In this section, you:

> [!div class="checklist"]
>
> * Download the test suite
> * Learn about the different sections of the suite

You need the test suite to:

* Validate that the dataset is uploaded correctly.
* Validate your connector.

## Initial setup

To ensure that you can run tests included in the test framework, the following prerequisites must be completed:

* Clone the [Data connectors](https://github.com/microsoft/DataConnectors) repo.
* Load the provided [test data](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/) in the data source. This step was discussed in the previous article. If you need to load the test data, refer to the [Power Query SDK test framework part 2 - Test data](./2-data.md) section and return to this page once you're done.

### Data connectors repo and the test suite

The [tests](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests) are part of the [Data connectors repo](https://github.com/microsoft/DataConnectors).

### Power Query SDK test framework - test suites

The test framework consists of a [test suite](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/TestSuites) to easily validate any extension connector.

The test suite consists of the following tests:

**Sanity**: The [sanity test set](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/TestSuites/Sanity) checks if the tests can connect to the data source and if the test tables exist with the correct schema. There are also tests that validate the row count and data of the NYCTaxiGreen and TaxiZoneLookup tables in the data source.

**Standard**: The [standard set](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/TestSuites/Standard) contains various tests needed to validate the connector. There are tests to validate the data types and the functions/operators for Math, Date, Time, Text, and so on. There are also tests to validate joins between the two tables.

## Conclusion

This section gave you an overview of the test suite and where to download it from.

In the next section, you learn about the various file formats and their purpose in the test framework.

## Next steps

[Power Query SDK test framework part 4 - Test format specification](./4-testformat.md)
