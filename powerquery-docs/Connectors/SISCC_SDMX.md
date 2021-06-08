---
title: SIS-CC SDMX connector
description: Provides basic information and prerequisites for the connector and descriptions of the optional input parameters.
author: David Barraclough
---

# SIS-CC SDMX 
 
## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets) |
| Authentication Types Supported | Anonymous |
| | |

## Prerequisites
When certified there should be no special installation required.

## Capabilities Supported
* Import

## Connection instructions

To connect to SDMX Web Service data:

1. Open Power BI 
2. Get Data, and type SDMX in the search box to quickly find this connector
3. In the "Data query URL" textbox put an SDMX REST data query URL (the web service must support the SDMX-CSV format). Example: https://stats-nsi-stable.pacificdata.org/rest/data/SPC,DF_COVID,1.0/M.PF+GU+FJ+PG+NC+MH+MP+SB+VU+WF+WS+_T.CASES+DEATHS?startPeriod=2020-03&dimensionAtObservation=AllDimensions
4. In the "Display format" dropdown make a selection between showing Labels and codes, codes only, or labels only
5. (optional) In the "Label language preference" specify a language using IETF BCP 47 format.
6. Click ok and the data will appear in the Preview screen with the standard Power BI transform optional step
7. Click Load and the dataset concepts will appear in the Fields pane to construct your report

## Limitations and issues

Apart from default Power BI limitations the connector is only limited by the capabilities of whichever SDMX web service is used in step 3 in Connection instructions.

More details on SDMX web services are on the SDMX standard's official web site: https://sdmx.org/?page_id=5008. Particularly for the REST web services: https://github.com/sdmx-twg/sdmx-rest/
