# Improve performance and reusability by separating data ingestion from data transformation dataflows

One of the best practices of dataflow implementation is separating responsibilities of dataflows into two layers: data ingestion and data transformation. This pattern is specifically helpful with multiple queries of the slower data sources in one dataflow or, multiple dataflows querying the same data sources. Instead of getting data from a slow data source again and again for each query, the data ingestion process can be done once, and the transformation can be done on top of that. This article, explains the process.

## On-Premises data source

In many scenarios, the on-premises data source is a slow data source. Especially considering that the gateway exists as the middle layer between the dataflow and the data source.

![getting data directly from the on-premises data source](media/1/DFfromOnePremDS.png)

Using Analytical dataflows for data ingestion minimizes the get data process from the source and focuses on loading data to Azure Data Lake storage. Once in storage, other dataflows can be created that leverage the ingestion dataflow's output and the Dataflow engine can read the data and perform the transformations directly from the data lake and without contacting the original data source or gateway.

![data ingestion dataflow](media/1/IngestionOnePremDS.png)

## Slow data source

The same process is valid when a data source is slow. Some of the software as a service data sources perform slow because of the limitations of their API calls.

## Separation of the data ingestion and data transformation dataflows

The separation of the two layers of data ingestion and transformation is helpful in the scenarios that the data source is slow. It helps to minimize the interaction with the data source.

This separation is not only useful because of the performance, it is also helpful for the scenarios that an old legacy data source system been migrated to a new system, in those cases, only the data ingestion dataflows need to be changed. The data transformation dataflows will be intact for this type of change.

![change the data source](media/1/DFChangeDataSource.png)
