---
title: Include file for the Limitations and considerations section of the Power Query Snowflake connector documentation
description: Include file for the Limitations and considerations section of the Power Query Snowflake connector documentation
ms.date: 03/10/2026
ms.topic: include
---

### Known issues in Snowflake connector implementation 2.0

Currently, the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) has the following known issues. There's ongoing work towards a fix and the documentation will be updated when a fix is released.

- Snowflake query with `count distinct` logic returns incorrect result.
- When creating relationships, encounter error `Object reference not set to an instance of an object`. The relationship can still be defined once you cancel the pop-up window.
- Increased memory use. The overall load time is typically faster using `Implementation="2.0"`, but the memory consumption can also be higher, in some cases causing issues such as `Resource Governing: This operation was canceled because there wasn't enough memory to finish running it. Either reduce the memory footprint of your dataset by doing things such as limiting the amount of imported data, or if using Power BI Premium, increase the memory of the Premium capacity where this dataset is hosted.`  

### Resolved issues

#### Hyphens in database names

If a database name has a hyphen in it, you can encounter an ```ODBC: ERROR[42000] SQL compilation error```. This issue is addressed in the September 2024 release.

#### Slicer visual for Boolean datatype

The slicer visual for the Boolean data type isn't functioning as expected in the June 2024 release. This nonfunctionality is a known issue. As a temporary solution, users can convert the Boolean data type in their reports to text by navigating to: Transfer -> Data Type -> Text. A fix is provided in October 2024 release.

#### Views not visible with Implementation="2.0"

In some version of the March 2025 release of Power BI Desktop, you might encounter an issue that views aren't visible when using the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) (`Implementation="2.0"`). This issue is fixed since the latest March 2025 release of Power BI Desktop. To try again, upgrade your installation.

#### TIMESTAMP_NTZ values are UTC with Implementation="2.0"

TIMESTAMP_LTZ types aren't being converted to the local time zone but are returning the UTC value when using the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) (`Implementation="2.0"`). For example, doing `SELECT CURRENT_TIMESTAMP` from Snowflake is returning the UTC time, not the user's local time zone. This issue is addressed in the July 2025 release.

#### Index was outside the bounds of the array when using Implementation="2.0"

In some scenarios, an error is thrown indicating the `Index was outside the bounds of the array` when using the [Snowflake connector implementation 2.0](#snowflake-connector-implementation-20) (`Implementation="2.0"`). This issue is addressed in the June 2025 release.
