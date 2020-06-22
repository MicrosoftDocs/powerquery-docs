# Merge queries: Left outer Join

A left outer join is one of the Join kinds available inside the Merge queries window in Power Query. You can read more about the Merge operations in Power Query from the article [Merge Operations Overview](merge-operations-overview.md).

This article demonstrates with a practical example how to perform a Merge operation using the Left Outer Join as the Join kind.

>[!Note]
>Samples used in this article are only to showcase the concepts. The concepts showcased here apply to all queries in Power Query.

## Sample input and output tables

The sample source tables for this example are:
* **Countries** - this is a reference table with the fields *id* and *Country*. The *id* represents the unique identifier of each record.

![Countries table](images/me-merge-operations-left-outer-join-countries-table.png)

* **Sales** - with the fields *Date*, *CountryID* and *Units*. The *CountryID* is a whole number value that representes de unique identifier from the Countries table

![Sales table](images/me-merge-operations-left-outer-join-sales-table.png)

The goal is to merge both tables where the Sales table will be the left table and the Countries table the right one. The join will be made between the following columns:

|Field from Sales table| Field from Countries table|
|-----------|------------------|
|CountryID|id|

The goal is to reach the following table where the name of the *Country* appears as a new column in the Sales table:

![Left outer join final table](images/me-merge-operations-left-outer-final-table.png)

## Do a Left Outer Join

* Select the Sales query and click the Merge queries button to create a new step inside the Sales query that wil merge the **Sales** query with the **Countries** query.
* Select the **Countries** as the *Right table for merge*
* Select thee *CountryID* column from the **Sales** table
* Select the *id* column from the **Countries** table
* From the *Join Kind* section, select the **Left outer** option
* Hit the OK button

![Merge window for left outer join](images/me-merge-operations-left-outer-merge-window.png)

From the newly created **Countries** column after the merge operation, expand the *Country* field without using the original column name as prefix.

![Expand table column for Country](images/me-merge-operations-left-outer-expand-field.png)

After doing this operation, thet desired result is reached:

![Left outer join final table](images/me-merge-operations-left-outer-final-table.png)