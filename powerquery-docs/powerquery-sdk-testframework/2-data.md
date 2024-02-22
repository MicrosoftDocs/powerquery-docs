---
title: Preparing the data
description: Uploading the test data to your data source
author: ryan-syed

ms.topic: reference
ms.date: 01/19/2024
ms.author: v-ryansyed
ms.custom:
---

# Power Query SDK Test Framework part 2 - Test Data

This multi-part reference covers the setup and running of a standard suite of tests for Power Query connector developers. The reference is meant to be followed sequentially—to ensure that your environment is set up for testing your extension connector.

In this section, you will:

> [!div class="checklist"]
>
> * Learn about the dataset used in the standard suite of the tests
> * Download a copy of the test data
> * Upload the data to your choice of database for the connector you intend to test

This section covers the test data that is used by the test suite to verify your connector.

## Overview of the dataset

The test data used for the framework is a modified version of the [NewYork City Taxi & Limousine Commission (TLC)](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) green trip record data.

The February 2023 green trip data was converted into "NycTaxiGreen" CSV file and 10,000 rows were sampled from it. Similarly, "TaxiZoneLookup" CSV file contains 265 rows from the taxi zone lookup table.
CSV data format was chosen due to its large applicability to nearly all other data sources, making it easier to import.

Review the following information carefully before importing the data:

The definition for each field might be slightly different from the information found in [NYC Taxi and Limousine green dataset - Azure Open Datasets](/azure/open-datasets/dataset-taxi-green?tabs=azureml-opendatasets) and [data_dictionary_trip_records_green.pdf (nyc.gov)](https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_green.pdf).

The dataset for our testing is split into two csv files: [NycTaxiGreen](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/nyc_taxi_tripdata.csv) and [TaxiZoneLookup](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/taxi+_zone_lookup.csv).

### Getting the test data

The test data is placed in the [Data Connectors git repo](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/). Test data is provided in the form of csv along with the [schema definition](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/PQSDKTestFrameworkDataSchema.sql) for [NycTaxiGreen](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/nyc_taxi_tripdata.csv) and [TaxiZoneLookup](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/taxi+_zone_lookup.csv) tables. This data should be loaded to your data source as separate tables and you need to ensure that the schema corresponds to the datatypes defined in your data source.

>[!NOTE]
> All decimal values while uploading to the datasource should have a **scale of 2** (i.e. the number of digits after the decimal point should be 2).
> All timestamp values should be uploaded to the datasouce in `MM/DD/YYYY HH24:MI:SS` format.

You can also review the [details regarding the test data](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/PQSDKTestData.md).

Resources:

* [NycTaxiGreen](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/nyc_taxi_tripdata.csv)
* [TaxiZoneLookup](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/taxi+_zone_lookup.csv)
* [Schema definition](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/PQSDKTestFrameworkDataSchema.sql)
* [Test Data documentation](https://github.com/microsoft/DataConnectors/tree/master/testframework/data/PQSDKTestData.md)

### NycTaxiGreen Table Description

The following table provides further information about each field in the *NycTaxiGreen* table:

|Name                         |Type       | Description                                                                                                                                                                                              |
|-----------------------------|:----------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| RecordID                    | Integer   | The original record ID order. The CSV starts with it out-of-order due to the random sampling. This field can be used as the primary key of the table.                                                    |
| VendorID                    | Integer   | Code indicating provider.                                                                                                                                                                                |
| lpep_pickup_datetime        | Timestamp | Timezone information isn't included. If the data source requires one, UTC should be used.                                                                                                                |
| lpep_dropoff_datetime       | Timestamp | Timezone information isn't included. If the data source requires one, UTC should be used.                                                                                                                |
| store_and_fwd_flag          | Boolean   | A true/false field. Some data sources might import this field as a character or string if the field type isn't specified. For the purposes of testing, this field should be specified as Boolean         |
| RatecodeID                  | Integer   | Rate code in effect at end of trip                                                                                                                                                                       |
| PULocationID                | Integer   | TLC Taxi Zone when the taximeter engaged                                                                                                                                                                 |
| DOLocationID                | Integer   | TLC Taxi Zone when the taximeter disengaged                                                                                                                                                              |
| passenger_count             | Integer   | Number of passengers in vehicle                                                                                                                                                                          |
| trip_distance               | Double    | Elapsed trip distance in miles                                                                                                                                                                           |
| fare_amount                 | Double    | Time-and-distance fare. **Two decimal** places.                                                                                                                                                          |
| extra                       | Double    | Misc charges. **Two decimal** places.                                                                                                                                                                    |
| mta_tax                     | Double    | MTA tax added. **Two decimal** places.                                                                                                                                                                   |
| tip_amount                  | Double    | Tip amount. **Two decimal** places.                                                                                                                                                                      |
| tolls_amount                | Double    | Total number of tolls paid on the trip. **Two decimal** places.                                                                                                                                          |
| improvement_surcharge       | Double    | An improvement surcharge. **Two decimal** places.                                                                                                                                                        |
| total_amount                | Double    | Total price charged to customers. Doesn't include tips. **Two decimal** places.                                                                                                                          |
| payment_type                | Integer   | A numeric code for how the passenger paid                                                                                                                                                                |
| trip_type                   | Integer   | A numeric code for whether the taxi was hailed or dispatched                                                                                                                                             |
| congestion_surcharge        | Double    | An extra charge for congestion. **Two decimal** places.                                                                                                                                                  |

### TaxiZoneLookup Table Description

The following table provides further information about each field in the *TaxiZoneLookup* table:

|Name          |Type     | Description                                                                                                                                                                 |
|--------------|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| LocationId   | Integer | Location ID for any location. It to maps to the PULocationID & DOLocationID in the NycTaxiGreen table. This field can be used as the primary key of the table.              |
| Borough      | String  | Borough for the location                                                                                                                                                    |
| Zone         | String  | Name of the Zone for the location                                                                                                                                           |
| service_zone | String  | Name of the Service Zone for the location                                                                                                                                   |

## Conclusion

This section described the test data used within the standardized test suite and its schema. Your database should now be populated with tables based on the specified csv files with the correct schema.

In the next section, you'll gain an understanding of different sections of the test suite that helps you validate the setup of the dataset and your extension connector.

## Next steps

[PowerQuery SDK Test Framework part 3 - Test Suite](./3-tests.md)
