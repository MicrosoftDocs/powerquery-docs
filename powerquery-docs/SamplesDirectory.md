---
title: Power Query connector samples
description: A list of functional, ODBC, and tutorial samples of Power Query connectors
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 12/09/2019
ms.author: gepopell

LocalizationGroup: reference
---

# List of Samples

We maintain a list of samples on the DataConnectors repo on Github. Each of the links below links to a folder in the sample repository. Generally these folders include a readme, one or more .pq / .query.pq files, a project file for Visual Studio, and in some cases icons. To open these in Visual Studio, make sure you've set up the SDK properly, and run the .mproj file from the cloned or downloaded folder.

## Functionality


| Sample | Description | Link |
| :--- | :--- | :------------------------------------------- |
| Hello World | This very simple sample shows the basic structure of a connector. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorld) |
| Hello World with Docs | Similar to the Hello World sample, this sample shows how to add documentation to a shared function. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorldWithDocs) |
| Navigation Tables | This sample provides two examples of how to create a navigation table for your data connector using the `Table.ToNavigationTable` function. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/NavigationTable) |
| Unit Testing | This sample shows how you can add simple unit testing to your \<extension>\.query.pq file. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/UnitTesting) |
| Relationships | This sample demonstrates the declaration of table relationships that will be detected by Power BI Desktop. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/Relationships) |
  
## OAuth

| Sample | Description | Link |
| :--- | :--- | :--- |
| Github | This sample corresponds to the [Github connector tutorial](samples/Github/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/Github) |
| MyGraph | This sample corresponds to the [Microsoft Graph connector tutorial](samples/MyGraph/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/MyGraph) |

## ODBC

| Sample | Description | Link |
| :--- | :--- | :--- |
| SQL | This connector sample serves as a template for ODBC connectors. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/SqlODBC) |
| Redshift | This connector sample uses the Redshift ODBC driver, and is based on the connector template. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/RedshiftODBC) |
| Hive LLAP | This connector sample uses the Hive ODBC driver, and is based on the connector template. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/HiveSample) |
| Snowflake | This connector sample uses the Snowflake ODBC driver, and is based on the connector template. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/SnowflakeODBC) |
| Impala | This connector sample uses the Cloudera Impala ODBC driver, and is based on the connector template. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/ImpalaODBC)
| Direct Query for SQL | This sample creates an ODBC based custom connector that enables Direct Query for SQL Server. | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/DirectQueryForSQL) |

## TripPin

| Sample | Description | Link |
| :--- | :--- | :--- |
| Part 1 | This sample corresponds to [TripPin Tutorial Part 1 - OData](samples/TripPin/1-OData/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/1-OData) |
| Part 2 | This sample corresponds to [TripPin Tutorial Part 2 - REST](samples/TripPin/2-Rest/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/2-Rest) |
| Part 3 | This sample corresponds to [TripPin Tutorial Part 3 - Navigation Tables](samples/TripPin/3-NavTables/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/3-NavTables) |
| Part 4 | This sample corresponds to [TripPin Tutorial Part 4 - Data Source Paths](samples/TripPin/4-Paths/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/4-Paths) |
| Part 5 | This sample corresponds to [TripPin Tutorial Part 5 - Paging](samples/TripPin/5-Paging/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/5-Paging) |
| Part 6 | This sample corresponds to [TripPin Tutorial Part 6 - Enforcing Schema](samples/TripPin/6-Schema/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/6-Schema) |
| Part 7 | This sample corresponds to [TripPin Tutorial Part 7 - Advanced Schema with M Types](samples/TripPin/7-AdvancedSchema/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/7-AdvancedSchema) |
| Part 8 | This sample corresponds to [TripPin Tutorial Part 8 - Adding Diagnostics](samples/TripPin/8-Diagnostics/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/8-Diagnostics) |
| Part 9 | This sample corresponds to [TripPin Tutorial Part 9 - Test Connection](samples/TripPin/9-TestConnection/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/9-TestConnection) |
| Part 10 | This sample corresponds to [TripPin Tutorial Part 10 - Query Folding Part 1](samples/TripPin/10-TableView1/README.md). | [Github Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/10-TableView1) |

