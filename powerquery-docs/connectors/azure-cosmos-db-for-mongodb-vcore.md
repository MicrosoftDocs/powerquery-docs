---
title: Azure Cosmos DB for MongoDB vCore Data Connector
description: Includes basic information and prerequisites, instructions on how to connect to your Azure Cosmos for Mongo vCore database, and information about advanced connection options.
author: KazimMir
ms.topic: conceptual
ms.date: 3/10/2025
ms.author: dougklo
---

# Azure Cosmos DB for MongoDB vCore

## Summary

| Item                             | Description                                                                                                                                                                    |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Release state                    | Beta                                                                                                                                                                           |
| Products supported               | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)                                                                                                                            |
| Authentication types supported   | Basic (username / password) for all of </br>Power BI Desktop, </br>Power Query Online with gateway, and </br>Power Query Online                                                |
| Function Reference Documentation | [Direct Query Function Support](#direct-query-support)</br>[Power Query M function reference](/powerquery-m/power-query-m-function-reference) |

## Prerequisites

## Capabilities supported

- Import Mode
- Direct Query Mode (Power BI semantic models)
  - [Supported Power Query Functions](#direct-query-support)
- [Native Mongo Queries](#native-mongo-queries)

## Connect to Azure Cosmos DB for MongoDB vCore database from Power Query Desktop

To connect to an Azure Cosmos DB for MongoDB vCore from Power Query Desktop, take the following steps:

1. Select **Azure Cosmos DB for MongoDB vCore** in the **Get Data** experience. The **Get Data** experience in Power Query Desktop varies between apps. For more information about the Power Query Desktop **Get Data** experience for your app, go to [Where to get data](../where-to-get-data.md).

1. In **Azure Cosmos DB for MongoDB vCore**, provide the Cosmos DB endpoint. Optionally provide a **Database Name** and a **Collection Name**. If a database name isn't provided, the upcoming **Navigator** screen shows all databases and their respective collections. Specifying both database and collection names only shows that collection. Specifying a collection name without a database name results in a connection error.

   ![Screenshot showing Azure Cosmos DB for MongoDB vCore database connection.](./media/azure-cosmos-db-for-mongodb-vcore/sign-in.png).

1. Select either the **Import** or **DirectQuery** data connectivity mode.

1. Select **OK**.

1. If it's the first time you're connecting to this database, input your username and password before selecting **Connect**.

   ![Screenshot showing Azure Cosmos DB for MongoDB vCore database authentication.](./media/azure-cosmos-db-for-mongodb-vcore/enter-credentials.png)

1. In **Navigator**, select the database information you want. A list of collections appear under each database. Select one or more collections and then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor. The list of databases and collections are affected if the optional **Database Name** and **Collection Name** were previously supplied.

   ![Screenshot showing Azure Cosmos DB for MongoDB vCore load or transform.](./media/azure-cosmos-db-for-mongodb-vcore/navigator-desktop.png)

## Connect to Azure Cosmos DB for MongoDB vCore database from Power Query Online

To connect to Azure Cosmos DB for MongoDB vCore database from Power Query Online:

1. Select the **Azure Cosmos DB for MongoDB vCore** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../where-to-get-data.md).

   ![Screenshot showing Azure Cosmos DB for MongoDB vCore icon in Power Query online.](./media/azure-cosmos-db-for-mongodb-vcore/online-select-mongodb-vcore.png)   

1. In the **Azure Cosmos DB for MongoDB vCore** dialog that appears, enter the Cosmos DB endpoint. Optionally provide a **Database Name** and a **Collection Name**. If a database name isn't provided, the upcoming **Navigator** screen shows all databases and their respective collections. Specifying both database and collection names only shows that collection. Specifying a collection name without a database name results in a connection error.

   ![Screenshot showing Azure Cosmos DB for MongoDB vCore Connection dialog in Power Query online.](./media/azure-cosmos-db-for-mongodb-vcore/online-connect-endpoint-sign-in.png)   

1. You can select an existing a connection or a data gateway. You can connect by specifying  the basic authentication kind specifying the username and password associated with the endpoint in the  **connection credentials** section and select **Next**.

1. Select one or multiple tables to import and use, then select Transform Data to transform data in the Power Query editor.

## Native Mongo Queries

The custom `Value.NativeQuery` function allows native MongoDB queries to be sent to the data source. The following example shows how to use the function to create a table when initially loading data. However, this function can be invoked at any time that the **Transform Data** option is available.

**Native Mongo Queries** are only supported in **Direct Query** mode.

1. Using the Navigator, select at least one collection and choosing **Transform Data**.

   ![Screenshot showing Native Mongo Query Transform Data.](./media/azure-cosmos-db-for-mongodb-vcore/transform-data-on-load.png)

1. Choose **Advanced Editor**. The **Advanced Editor** dialog appears to show the initial query that would be used to fetch all the data in the selected collection.

   ![Screenshot showing Native Mongo Query Initial Advanced Editor before.](./media/azure-cosmos-db-for-mongodb-vcore/native-query-advanced-editor-before.png)

1. The `Value.NativeQuery` function takes two arguments: a Source, and the query itself. The Source variable is populated with all the information needed to connect to the database. If desired, update the name of the collection that the query runs against. The collection doesn't have to be the same as the one selected in the **Navigator**.

   ![Screenshot showing Native Mongo Query Initial Advanced Editor after.](./media/azure-cosmos-db-for-mongodb-vcore/native-query-advanced-editor-after.png)

1. The second argument is a valid MongoDB query, enclosed in double-quotation marks. Quotation marks within the query are escaped with another quotation mark, for example, `"num1"` to `""$num1""`

1. Choose **Done** to transform the data.

1. As no schema information is returned from Cosmos DB after the query is executed, the resultant table will identify all column types as _any_. Either transform the columns using **Detect Data Type** or manually change the data type for columns of interest. Update the name of the resultant table if desired.

   ![Screenshot showing Native Mongo Query Transform Data Type.](./media/azure-cosmos-db-for-mongodb-vcore/native-query-transform-data-type.png)

1. Once the **Power Query Editor** is closed and the changes applied, the resultant table appears in the **Data** pane.

   ![Screenshot showing Native Mongo Query Transform Data Type final result.](./media/azure-cosmos-db-for-mongodb-vcore/native-query-final-result.png)

Refer to [Troubleshooting & Limitations](#troubleshooting--limitations) for limitations of the `Value.NativeQuery` function.

## Direct Query Support

**Direct Query** supports the following Power Query functions:

- `Date.From`, `DateTime.From`, `DateTimeZone.From`, `Date.Day`, `Date.DayOfWeek`, `Date.DayOfYear`, `Date.Month`, `Date.WeekOfYear`, `Date.Year`
- `List.Average`, `List.Contains`, `List.First`, `List.Last`, `List.Max`, `List.Min`, `List.Sum`
- `Int64.From`, `Currency.From`, `Percentage.From`, `Text.From`, `Logical.From`, `Logical.FromText`, `Logical.ToText`
- `Number.Abs`, `Number.Mod`, `Number.Round`, `Number.RoundAwayFromZero`, `Number.RoundDown`, `Number.RoundTowardZero`, `Number.RoundUp`
- `Table.RowCount`
- `Time.Hour`, `Time.Minute`, `Time.Second`
- `Value.Add`, `Value.Divide`, `Value.Equals`, `Value.Multiply`, `Value.NullableEquals`, `Value.Subtract`

## Troubleshooting & Limitations

- As [Power Query Text functions](/powerquery-m/text-functions) aren't yet supported, neither is using **Text Filters** on a column when **Transforming Data** in **Direct Query** mode.

  - Examples of such filters: _Begins With_, _Ends With_, _Contains_, etc.
  - An error message appears similar to _Unsupported Operation: Unsupported function invocation: 'Text.StartsWith'_

- As not all Power Query functions are supported when using **Direct Query**, either switch to **Import Mode** or issue a **Native Mongo Query** that accomplishes the intent of one or more missing Power Query functions.

- No schema information is returned when using **Native Mongo Queries**. All columns are considered `any` and need to be manually transformed to the desired data type.

- The custom `Value.NativeQuery` function samples only the first document that is returned from the query in order to construct the resultant table. The consequence is that if there are more fields in subsequent documents, those fields aren't included in the resultant table. Either project specific columns or query a specific compensating view.

- The custom `Value.NativeQuery` function can only be used with **Direct Query** and not with **Import Mode**.

- Power BI drops the milliseconds from date types when applying a built-in filter. Thus if a date type has milliseconds in it then those built-in filters don't work.

- Negative OLE times (Dates from before 1899, December 30) for `Date.From`, `DateTime.From`, and `DateTimeZone.From` don't work.

- Using the Power BI `DateTimeZone.From` function results in a _(400): Bad Request_ error from the Cosmos DB server as the `dateFromString` functionality isn't added to Cosmos DB for MongoDB.

- Field names that contain special characters aren't supported (for example, `$`, `.`, `@`, etc.).

- When a divide by 0 is encountered using **Direct Query**, the query fails. It differs from the usual `#infinity` Power BI result, but aligns with MongoDB behavior.

- The following data types are currently considered as strings. As such, using values with these data types can't be used for filtering in Direct Query, as the push down fails:
  - decimal128
  - regularExpression
  - timestamp

- The recommendation for any field you wish to use in Power BI is to ensure that field is in every document within your collection. It ensures it always shows up in Power BI.