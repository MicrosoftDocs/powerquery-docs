---
title: Include file for the Limitations and considerations section of the Power Query Azure Cosmos Db For Mongodb Vcore connector documentation
description: Include file for the Limitations and considerations section of the Power Query Azure Cosmos Db For Mongodb Vcore connector documentation
author: whhender
ms.author: whhender
ms.date: 03/10/2026
ms.topic: include
---

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

- The recommendation for any field you want to use in Power BI is to ensure that field is in every document within your collection. It ensures it always shows up in Power BI.
