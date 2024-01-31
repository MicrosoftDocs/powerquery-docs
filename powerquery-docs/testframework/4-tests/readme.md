---
title: Getting the test suite
description: Overview of the Test Suite
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Testing Framework part 4 - Test Suite

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be followed sequentially—to ensure that your environment is set up for testing your extension connector.

In this lesson, you will:

> [!div class="checklist"]
> * Download the test suite
> * Learn about the different section of the suite

Next you would need the Test Suite to:

* Verify that the dataset is uploaded correctly, and
* Validate your connector.

## Initial Setup

[TODO: Is prebuilt the right terminology here?]

To ensure that you can run these prebuilt tests, the below prerequisites must be completed before running the tests:

[TODO: Get the details of the repo]

* Clone the [DataConnectors](https://github.com/microsoft/DataConnectors) repo.
* Load the provided [test data](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/) in the data source. This step was discussed in the previous section. If you not completed, refer to [Power Query SDK Test Framework part 3 - Test Data](../3-data/readme.md) section and come back to this page once done.

### DataConnectors repo and the test suite

[TODO: Find the correct path for the repo and the docs]

The [tests](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests) are part of the [DataConnectors repo](https://github.com/microsoft/DataConnectors). Refer the [DataConnectors README](https://github.com/microsoft/DataConnectors/blob/master/README.md) for information on Custom Connectors built with the Power Query SDK and how to build the projects in the repo.

### PQ SDK Test Framework - Test Suites

[TODO: Is prebuilt the right terminology here?]

The PQ SDK Test Framework consists of prebuilt [test suite](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/TestSuites) to easily validate any extension connector.

The test suite consists of the following tests:

**Sanity**: The [sanity test set](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/TestSuites/Sanity) validates that the tests are able to connect to the data source and the test tables with correct schema exist in the datasource. There are also tests that validate the rowcount and data of NYCTaxiGreen and TaxiZoneLookup tables in the datasource.

**Standard**: The [standard set](https://github.com/microsoft/DataConnectors/tree/master/testframework/tests/TestSuites/Standard) contains various tests needed to validate the connector. There are tests to test the datatypes, and functions/operators for Math, Date, Time, Text etc. There are also tests to validate joins between the two tables as well.

[TODO: Add details regarding the test suite update and changelog]
## Updates for the test suite

## Conclusion

This lesson gave you an overview of the test suite and where to download it from.

In the next lesson, you'll learn about the various file formats, and their purpose with the Test Framework.

## Next steps

[Power Query SDK Testing Framework part 5 - Test Format Specification](../5-testformat/readme.md)
