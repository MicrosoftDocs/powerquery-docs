# Field Mapping considerations for standard dataflows

When you create dataflows that write their output into Common Data Service, you can follow some guide lines and best practices to get the best outcome. In this article, some of those best practices are mentioned.

## Set the Key field in the Entity

Having a primary key column in the entity helps in avoiding duplicates in the data rows. A primary key column is a column that is unique and deterministic of a data row in the entity. For example, In an Orders table, If the Order ID is the primary key column, you should not have two rows with the same Order ID, and one Order ID, Let's say order with the ID 345, should only represent one row in the entity.

Too choose the key column for the entity in the common data service from the dataflow, you need to set the Alternate Key.

This is how you can choose the Key column to be populated from the source when you create a new entity in the dataflow;

![primary key and the alternate key are the same](media/PKAKsame.png)

The primary name field that you see in the field mapping is for a label field, this field doesn't need to be unique. The field that will be used in the entity for checking duplication will be the field that you set in the Alternate Key field.

Having a primary key in the entity ensures that even if you have duplicate data rows with the same value in the field that is mapped to the primary key, the duplicate entries won't be loaded into the entity, and entity will always have the high quality of the data. Having an entity with a high quality of data is essential in building reporting solutions based on it.

### The Primary Name field

The primary name field is a display field used in Common Data Service. This field is used in default views to show the content of the entity in other applications. This field is not the primary key field, and should not be considered as that. This field can have duplicates, because it is a display field. The best practice, however, is to use a concatenated field to map to the primary name field, so that the name is fully explanatory.

The alternate Key field is what will be used as the primary key.

## What are good candidates of the Key field

The key field is a unique value representing a unique row in the entity. It is important to have this field, because it helps avoiding having duplicate records in the entity. This field can come from three sources;

- The primary key in the source system (Such as OrderID in the example above)

- A concatenated field created through Power Query transformations in the dataflow. 

  ![merging columns to create a concatenated unique column](media/MergeColumnsDataflow.png)

- A combination of fields to be selected in the Alternate Key option. A combination of fields used as a key field is also called as Composite Key.

  ![creating a composite key through the field mapping](media/CompositeKeyMapping.png)

## Remove rows that no longer exists

If you wish to always have the data in your entity to be synchronized with the data from the source system, you can choose the option for "Delete rows that no longer exist in the query output". However, be mindful that this option will slow down the dataflow, because there is a need for a row comparison based on the primary key (Alternate Key in the field mapping of the dataflow) for this action to happen.

Having this option checked means that if there is a data row in the entity that does not exist in the next dataflow refresh's query output, that row will be removed from the entity.

![delete rows that no longer exists](media/DeleteRowsNotExist.png)



