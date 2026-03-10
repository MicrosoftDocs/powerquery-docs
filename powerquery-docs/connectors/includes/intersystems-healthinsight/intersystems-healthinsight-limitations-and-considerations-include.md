---
title: Include file for the Limitations and considerations section of the Power Query Intersystems Healthinsight connector documentation
description: Include file for the Limitations and considerations section of the Power Query Intersystems Healthinsight connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

### Booleans cause errors in DirectQuery mode

When you use Power BI in Direct Query mode, attempting to create filters, slicers, or visuals with Health Insight Booleans results in errors. These errors occur because the InterSystems Health Insight Connector exposes Booleans as the BIT datatype. Power BI can't handle BIT data in DirectQuery mode and returns a folding error if you attempt to create filters, slicers, or visuals.

You can correct this issue by exposing the Boolean in a view via a CAST statement. For example:

CAST((CASE WHEN *fieldname*=1 then 1 ELSE 0 END) as INTEGER) as *fieldname*

...where *fieldname* is the Boolean in question.

This CAST statement exposes the Boolean as an Integer, which Power BI can handle without error. Any NULLs are defaulted to 0.

You can either create your own views or use the CreateViewEntry utility to create a view for any Health Insight table with this issue.

### Long strings cause errors in DirectQuery mode

When you use Power BI in DirectQuery mode, attempting to create filters, slicers, or visuals with long Health Insight strings results in errors. When data is brought into a report in DirectQuery mode, the Power BI engine tries to limit the number of queries sent to the source environment and attempts to use data that it has cached in memory. When the engine uses cached memory data, it's unable to handle larger strings and returns a folding error.

For example, Gender_Code in HSAA.Patient has a maximum length of 32,000 and causes errors in DirectQuery mode. You can correct this issue by exposing the property in a view via a CAST statement. For example:

CAST(*fieldname* AS VARCHAR(4000)) as *fieldname*

...where *fieldname* is the long string in question.

This CAST statement limits the schema maximum length that is sent to Power BI. Ensure that you don't eliminate important data via this CAST statement. As an example, you might confirm that your Gender_Code data never exceeds 4,000 characters in length, meaning that you can shorten the maximum length that's sent to Power BI without consequence.

You can either create your own views or use the CreateViewEntry utility to create a view for any Health Insight table with this issue.
