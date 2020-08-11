# Better performance with the separation of data ingestion and data transformation dataflows

One of the best practices of dataflow implementation is the separation of dataflows into layers of data ingestion and data transformation. This specifically helps with the slower data sources. Instead of getting data from a slow data source again and again, the data ingestion process can be done once, and the transformation can be done on top of that. This article, explains the process.

## On-Premises data source

In many scenarios, the on-premises data source is a slow data source. Especially considering that the gateway exists as the middle layer between the dataflow and the data source.

![getting data directly from the on-premises data source](media/1/DFfromOnePremDS.png)

Using data ingestion dataflows minimizes the get data process from the source, and the rest of the operation will be using the result of the data ingestion dataflows.

![data ingestion dataflow](media/1/IngestionOnePremDS.png)

## Slow data source

The same process is valid when a data source is slow. Some of the software as a service data sources perform slow because of the limitations of their API calls.

## Separation of the data ingestion and data transformation dataflows

The separation of the two layers of data ingestion and transformation is helpful in the scenarios that the data source is slow. It helps to minimize the interaction with the data source.

This separation is not only useful because of the performance, it is also helpful for the scenarios that an old legacy data source system been migrated to a new system, in those cases, only the data ingestion dataflows need to be changed. The data transformation dataflows will be intact for this type of change.

![change the data source](media/1/DFChangeDataSource.png)