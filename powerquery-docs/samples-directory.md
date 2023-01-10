---
title: Power Query connector samples
description: A list of functional, ODBC, and tutorial samples of Power Query connectors
author: ptyx507x
ms.topic: conceptual
ms.date: 1/9/2023
ms.author: miescobar
---

# List of Samples

We maintain a list of samples on the DataConnectors repo on GitHub. Each of the links below links to a folder in the sample repository. Generally these folders include a readme, one or more .pq / .query.pq files, a project file for Visual Studio, and in some cases icons. To open these files in Visual Studio, make sure you've set up the SDK properly, and run the .mproj file from the cloned or downloaded folder.

## Functionality


| Sample | Description | Link |
| :--- | :--- | :------------------------------------------- |
| Hello World | This simple sample shows the basic structure of a connector. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorld) |
| Hello World with Docs | Similar to the Hello World sample, this sample shows how to add documentation to a shared function. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorldWithDocs) |
| Navigation Tables | This sample provides two examples of how to create a navigation table for your data connector using the `Table.ToNavigationTable` function. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/NavigationTable) |
| Unit Testing | This sample shows how you can add simple unit testing to your \<extension>\.query.pq file. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/UnitTesting) |
| Relationships | This sample demonstrates the declaration of table relationships that will be detected by Power BI Desktop. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/Relationships) |
  
## OAuth

| Sample | Description | Link |
| :--- | :--- | :--- |
| GitHub | This sample corresponds to the [GitHub connector tutorial](samples/github/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/Github) |

## ODBC

| Sample | Description | Link |
| :--- | :--- | :--- |
| SQL | This connector sample serves as a template for ODBC connectors. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/SqlODBC) |
| Redshift | This connector sample uses the Redshift ODBC driver, and is based on the connector template. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/RedshiftODBC) |
| Hive LLAP | This connector sample uses the Hive ODBC driver, and is based on the connector template. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/HiveSample) |
| Snowflake | This connector sample uses the Snowflake ODBC driver, and is based on the connector template. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/SnowflakeODBC) |
| Impala | This connector sample uses the Cloudera Impala ODBC driver, and is based on the connector template. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/ODBC/ImpalaODBC)
| Direct Query for SQL | This sample creates an ODBC-based custom connector that enables Direct Query for SQL Server. | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/DirectQueryForSQL) |

## TripPin

| Sample | Description | Link |
| :--- | :--- | :--- |
| Part 1 | This sample corresponds to [TripPin Tutorial Part 1 - OData](samples/trippin/1-odata/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/1-OData) |
| Part 2 | This sample corresponds to [TripPin Tutorial Part 2 - REST](samples/trippin/2-rest/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/2-Rest) |
| Part 3 | This sample corresponds to [TripPin Tutorial Part 3 - Navigation Tables](samples/trippin/3-navtables/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/3-NavTables) |
| Part 4 | This sample corresponds to [TripPin Tutorial Part 4 - Data Source Paths](samples/trippin/4-paths/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/4-Paths) |
| Part 5 | This sample corresponds to [TripPin Tutorial Part 5 - Paging](samples/trippin/5-paging/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/5-Paging) |
| Part 6 | This sample corresponds to [TripPin Tutorial Part 6 - Enforcing Schema](samples/trippin/6-schema/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/6-Schema) |
| Part 7 | This sample corresponds to [TripPin Tutorial Part 7 - Advanced Schema with M Types](samples/trippin/7-advancedschema/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/7-AdvancedSchema) |
| Part 8 | This sample corresponds to [TripPin Tutorial Part 8 - Adding Diagnostics](samples/trippin/8-diagnostics/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/8-Diagnostics) |
| Part 9 | This sample corresponds to [TripPin Tutorial Part 9 - Test Connection](samples/trippin/9-testconnection/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/9-TestConnection) |
| Part 10 | This sample corresponds to [TripPin Tutorial Part 10 - Basic Query Folding](samples/trippin/10-tableview1/readme.md). | [GitHub Link](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/10-TableView1) |
