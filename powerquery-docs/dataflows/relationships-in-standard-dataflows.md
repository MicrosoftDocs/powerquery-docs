# Mapping fields with relationships in standard dataflows

In the standard dataflow, you can easily map the fields from the dataflow query into the Common Data Services entities. However, if your fields are lookup or relationship fields, some best practices should be followed to make sure this process works.

## What are Lookup or Relationship fields?

In the Common Data Services, you can have a field defined as a lookup field, which points to another entity.

![Lookup field](media/1/LookupField.png)

In the image above, the Region field in a lookup field to another entity named "Region Lookup".

## When the field mapping doesn't show the relationship fields

If you have just created a lookup field pointing to an entity, that field in the mapping of the dataflow, might not appear. The reason is that each entity requires a Key field. This best practice would then makes sure that the field is mappable in the entity mappings of the dataflow.

## Setting the Key field in the entity

To set the key field in the entity, you simply need to go to the Keys tab, and add a Key to a field which has unique values.

![Set a key field](media/1/SetKey.png)

After setting the key field, you can see the field in the mapping of the dataflow

![mapping fields](media/1/FieldMappingLookup.png)

## Run the dataflow for the referenced (lookup) entity first

Another important best practice is to load the data into the referenced or lookup entity first. The reason for this is to load all possible values in the lookup entity, so that when you load data into an entity that is using a lookup field, it performs without any problems.