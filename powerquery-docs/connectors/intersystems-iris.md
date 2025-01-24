---
title: Intersystems IRIS
description: Provides basic details for the Intersystems IRIS connector for Power BI.
author: Julie Bolinsky
ms.topic: conceptual
ms.date: 5/3/2024
ms.author: jbolinsk
---

# InterSystems IRIS Connector for Power BI  - Deprecation Notice
The Intersystems IRIS connector will no longer be a standard Microsoft Power Query connector starting September 1, 2024.

For clients who have built reports/dashboards using the Intersystems IRIS (Beta) connector, replace the Intersystems IRIS connector with the [Intersystems Health Insight](intersystems-healthinsight.md) connector. Incorporate the Intersystems Health Insight connector into your existing PBIX file(s), and then update your *Source* for each entry (changing from IRIS.Database to IntersystemsHealthInsight.Database). If any issues arise, contact InterSystems' [Worldwide Response Center](https://wrc.intersystems.com).

## InterSystems IRIS Connector 

The InterSystems IRIS Connector for Power BI is a custom connector for InterSystems IRIS Data Platform users, built on top of the industry standard ODBC protocol. Benefits include:
- Dedicated database connection option, **supported by InterSystems**
- Full DirectQuery support, leveraging the high-performance **InterSystems IRIS SQL engine**
- Transparent access to **InterSystems IRIS BI Cubes**

Visit the [documentation](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=APOWER) for connection, usage, and troubleshooting instructions.

## Summary

|**Item**                              |**Description**                                        |
|:-------------------------------------|:------------------------------------------------------|
| Release State                        | General Availability                                  |
| Products Supported                   | Power BI (Semantic models)                            |
|                                      | Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)       |
| Authentication types supported       | IRIS account                                          |

## Prerequisites

To use the Intersystems IRIS connector, you must have an IRIS account (user/password) and your user must have privileges to access the SQL tables, views and cubes. You must also have the IRIS ODBC driver installed. 
The IRIS ODBC driver can be downloaded from the [WRC distributions page](https://wrc.intersystems.com/wrc/coDistGen.csp) and installed separately. 

## Capabilities supported

- Import
- DirectQuery (Power BI semantic models)

### Additional Troubleshooting

* *I'm getting the following error: "Expression.Error: the field 'Value' of the record wasn't found"*
  
  This error appears when you're trying to use the connector from a system that doesn't have the InterSystems IRIS ODBC driver installed. As we can't package the ODBC driver inside the connector, it has to be downloaded from the [WRC distributions page](https://wrc.intersystems.com/wrc/coDistGen.csp) and installed separately. Note that it will typically have been installed automatically if your workstation also has an InterSystems IRIS instance installed.
  The InterSystems Cach&eacute; and Ensemble ODBC drivers isn't recognized by the connector.

* *Can I connect to a version earlier than InterSystems IRIS 2019.2?*

   Yes. The connector is based on standard ODBC connectivity and therefore works with any version of InterSystems IRIS. Only for browsing the InterSystems IRIS BI catalog, certain limitations apply:
   * The BI cube metadata is queried through an API that is new in 2019.2. If that API isn't present, a best-effort fallback query is baked into the connector. You can also [request a patch](#help) (CatalogQueries.xml) that adds the API to earlier versions of InterSystems IRIS and can be imported into the namespace you'll be connecting to.
   * Prior to 2019.1, the links between the fact and dimension tables was expressed through a proprietary relationship mechanism that isn't automatically read by the connector. If you are using BI cubes on a version earlier than 2019.1, you'll have to define these relationships manually. (We are evaluating alternative approaches to address this issue.)

* *Can I connect to Caché or Ensemble?*

  Support for accessing Caché or Ensemble instances using the InterSystems IRIS ODBC driver is planned for a later release in 2019. For other functional limitations, see the section above.

## Further assistance

For further assistance, contact InterSystems' [Worldwide Response Center](https://wrc.intersystems.com).
