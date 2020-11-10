# Understanding the map entities experience

Dataflows allow you to extract and transform data using the Power Query exprience. Once you are satisfied with the shape of the data, you need to instruct dataflows what to do with the data that will be generated for each query. The map entities experience lets you configure what a dataflow should do with each query you define. This article explains the options available to you in the map entities exprience. 

# Queries, Load settings, and Field mapping

The map entities experience contains three sections as seen in the image below:
 ![Map entities experience](media/MapEntitiesExperienceSections.png)

## Queries

The quries section simply provides the list of queries defined in the dataflow. You will need configure the load setting for each query in the dataflow.

## Load Settings

The load settings section allows you to indicate if and where data in the query should be loaded to. The available options are:

1. Load data in the query to an existing entity - This option allows you to choose from the list of already available Common Data Service entities in the environment. By default, Common Data Service environments contain pre-defined entities, but customers can also create their own custom entities in Common Data Service which will appear in the list of entities you can choose from.

2. Load data in the query to a new entity - This option will load the data to a new, net yet defined entity. This option provides the convinience of creating a new entity directly from the dataflow experience, and loading data to it. The entity will be created when the dataflow is first saved, and each time the dataflow runs, it will load data to this entity. It worth mentioning that the experience to create entities from the dataflow's Map entities experience is less feature rich than creating entities via the new entity exprience. For most use cases, the experience is sufficient but in more advanced scenarios, it might not provide all required functionality.

3. Dont load the data in the query - This option will not load the data in the query to any Common Data Service entity. Its usful for more advanced scenarios where you might need the data in the query only during the time the dataflow is running, but dont require the information after the dataflow completes its run. For example, if you are using parameters, you probably dont need to store the value of the parameter in a Common Data Service entity, but the value in that query is used by other queries to filter thair data.

### Entity name, display name and description

When creating a new entity, you must provide a name and display name for the entity. A description is recommended but not required. This article provides more details about these fields and what they are used for. Existing entities will already have these fields populated and they cannot be changed.

### Delete rows that no longer exist in the query output

If you wish to always have the data in your entity to be synchronized with the data from the source system, you can choose the option for "Delete rows that no longer exist in the query output". This means that after each time the dataflow will run, the number of records in the source query will equal the number of records in the Common Data Service entity. For example: If a query loads data to a common data service entity from an excel file that is constantly being updated, on day 1 the excel file contains 500 records/rows, after the dataflow run completes, the entity will have 500 records. If on day 2 the excel file has 200 records/rows, then the after the dataflow run the entity will have 200 records. 

Important notes:
1. You should be mindful that this option will cause the dataflow to run slower because it must compare each record/row in the source query to records already written to Common Data Service and delete those that no longer exist.

2. In order to use this feature, an alternate key field must be configured in the field mapping section of the map entities experience. Both alternate keys and the field mapping secionts are discussed below.

![delete rows that no longer exists](media/DeleteRowsNotExist.png)

## Field mapping

Common Data Service entities contain fields. Fields define the individual data items that can be used to store information in an entity. The field mapping experience allows you to designate which columns in the soruce query should populate which fields in the Common Data Service entity. The expeirence varies slightly when loading to a new vs existing entity as described below:

### Field mapping when loading to new entity
When creating a new entity, each column in the source query will populate one field in the common data service entity you create.

### Field mapping when loading to existing entity
When loading data to an existing entity, its fields were already defined. Each field in the destination entity will appear in the mapping experience and you can choose if and which source column to populate the destination fields with.

In addition to data fields, there are two additional properties in the field mapping experience which are special: Primary name field and alternate key fields. These fields will be discussed separatly and in more detail below.

### The Primary Name field

The primary name field is a special field in Common Data Service entities. The purpose of this field is help people easily indentify a record and it is used by applicaitons to help people distingush between records/rows in an entity without displaying all the entities field. For example, in an entity that represents customers, the customer name or customer address would be great candidates to easily indentify customers. While it is recommended this field be unique, its uniquness is not enforced and two records may have the same primany name field values. The best practice is to use a unique, human readable value so that the name is fully explanatory.

### The Alternate Key field

Key fields provide an efficient and accurate way of integrating data with external systems. Key fields are essential for a dataflow to determine if records in the source queries dont yes exist in the destination entity and should be created, or, if they already exist, and should be updated. They are also required if "Delete rows no longer in the source query" option is selected, to help dataflows identify which records should be deleted if they are no longer present in the source query.

A Key field is a unique and deterministic way for programs to identiy a record/row in the entity. An entity cannot have more than one record with the same value if its a key field. For example, in an Orders table, If the Order ID is a key field, you should not have two rows with the same Order ID, and one Order ID, Let's say order with the ID 345, should only represent one row in the entity.

Below image shows how you can choose the Key column to be populated from the source when you create a new entity in the dataflow;

![primary key and the alternate key are the same](media/PKAKsame.png)

Having a key field in an entity ensures that even if you have duplicate data rows with the same value in the field that is mapped to the primary key, the duplicate entries won't be loaded into the entity, and entity will always have the high quality of the data. Having an entity with a high quality of data is essential in building reporting solutions based on it. A key field is not always required, for example, if you know your data is unique and you only plan on loading data to an entity one time, then there is no need to define a key field on the entity. However, its always good practice to do so.

### What are good candidates of the Key field

The key field is a unique value representing a unique row in the entity. It is important to have this field, because it helps avoiding having duplicate records in the entity. This field can come from three sources;

- The primary key in the source system (Such as OrderID in the example above)

- A concatenated field created through Power Query transformations in the dataflow. 

  ![merging columns to create a concatenated unique column](media/MergeColumnsDataflow.png)

- A combination of fields to be selected in the Alternate Key option. A combination of fields used as a key field is also called as Composite Key.

  ![creating a composite key through the field mapping](media/CompositeKeyMapping.png)





