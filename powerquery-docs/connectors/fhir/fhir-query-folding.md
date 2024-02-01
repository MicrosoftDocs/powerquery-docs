---
title: FHIR Power Query folding
description: Power Query connector for FHIR query folding
author: hansenms
ms.topic: conceptual
ms.date: 7/25/2023
ms.author: mihansen
---

# FHIR query folding

[Power Query folding](../../power-query-folding.md) is the mechanism used by a Power Query connector to turn data transformations into queries that are sent to the data source. This allows Power Query to off-load as much of the data selection as possible to the data source rather than retrieving large amounts of unneeded data only to discard it in the client. The Power Query connector for FHIR includes query folding capabilities, but due to the nature of [FHIR search](https://www.hl7.org/fhir/search.html), special attention must be given to the Power Query expressions to ensure that query folding is performed when possible. This article explains the basics of FHIR Power Query folding and provides guidelines and examples.

## FHIR and query folding

Suppose you are constructing a query to retrieve "Patient" resources from a FHIR server and you are interested in patients born before the year 1980. Such a query could look like:

```powerquery-m
let
    Source = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null),
    Patient1 = Source{[Name="Patient"]}[Data],
    #"Filtered Rows" = Table.SelectRows(Patient1, each [birthDate] < #date(1980, 1, 1))
in
    #"Filtered Rows"
```

Instead of retrieving all Patient resources from the FHIR server and filtering them in the client (Power BI), it's more efficient to send a query with a search parameter to the FHIR server:

```
GET https://myfhirserver.azurehealthcareapis.com/Patient?birthdate=lt1980-01-01
```

With such a query, the client would only receive the patients of interest and would not need to discard data in the client.

In the example of a birth date, the query folding is straightforward, but in general it is challenging in FHIR because the search parameter names don't always correspond to the data field names and frequently multiple data fields will contribute to a single search parameter.

For example, let's consider the `Observation` resource and the `category` field. The `Observation.category` field is a `CodeableConcept` in FHIR, which has a `coding` field, which have `system` and `code` fields (among other fields). Suppose you're interested in vital-signs only, you would be interested in Observations where `Observation.category.coding.code = "vital-signs"`, but the FHIR search would look something like `https://myfhirserver.azurehealthcareapis.com/Observation?category=vital-signs`.

To be able to achieve query folding in the more complicated cases, the Power Query connector for FHIR matches Power Query expressions with a list of expression patterns and translates them into appropriate search parameters. The expression patterns are generated from the FHIR specification.

This matching with expression patterns works best when any selection expressions (filtering) is done as early as possible in data transformation steps before any other shaping of the data.

> [!NOTE]
> To give the Power Query engine the best chance of performing query folding, you should do all data selection expressions before any shaping of the data.

## Query folding example

To illustrate efficient query folding, we'll walk through the example of getting all vital signs from the Observation resource. The intuitive way to do this would be to first expand the `Observation.category` field and then expand `Observation.category.coding` and then filter. The query would look something like this:

```powerquery-m
// Inefficient Power Query
let
    Source = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null),
    Observation = Source{[Name="Observation"]}[Data],
    ExpandCategory = Table.ExpandTableColumn(Observation, "category", {"coding"}, {"category.coding"}),
    ExpandCoding = Table.ExpandTableColumn(ExpandCategory, "category.coding", {"system", "code"}, {"category.coding.system", "category.coding.code"}),
    FilteredRows = Table.SelectRows(ExpandCoding, each ([category.coding.code] = "vital-signs"))
in
    FilteredRows
```

Unfortunately, the Power Query engine no longer recognized that as a selection pattern that maps to the `category` search parameter, but if you restructure the query to:

```powerquery-m
// Efficient Power Query allowing folding
let
    Source = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null),
    Observation = Source{[Name="Observation"]}[Data],
    FilteredObservations = Table.SelectRows(Observation, each Table.MatchesAnyRows([category], each Table.MatchesAnyRows([coding], each [code] = "vital-signs"))),
    ExpandCategory = Table.ExpandTableColumn(FilteredObservations, "category", {"coding"}, {"category.coding"}),
    ExpandCoding = Table.ExpandTableColumn(ExpandCategory, "category.coding", {"system", "code"}, {"category.coding.system", "category.coding.code"})
in
    ExpandCoding
```

The search query `/Observation?category=vital-signs` will be sent to the FHIR server, which will reduce the amount of data that the client will receive from the server.

While the first and the second Power Query expressions will result in the same data set, the latter will, in general, result in better query performance. It's important to note that the second, more efficient, version of the query can't be obtained purely through data shaping with the graphical user interface (GUI). It's necessary to write the query in the "Advanced Editor".

The initial data exploration can be done with the GUI query editor, but it's recommended that the query be refactored with query folding in mind. Specifically, selective queries (filtering) should be performed as early as possible.

## Finding folding patterns

The Power Query connector for FHIR will only be able to perform query folding if the Power Query expressions map to known search parameters as defined by the FHIR specification. If you're wondering if query folding is possible, we recommend that you consult the [FHIR specification](https://hl7.org/fhir). Each resource will list a set of search parameters towards the bottom of the specification page. You can also consult the [folding query patterns](fhir-queryfoldingpatterns.md) page for examples of how to write foldable Power Query Expressions for FHIR.

## Debugging query folding

If you're trying to determine if a given Power Query expression is being folded and what the resulting FHIR search expression is, you can start [Fiddler](https://www.telerik.com/fiddler) while shaping queries in Power BI Desktop.

## Summary

Query folding provides more efficient Power Query expressions. A properly crafted Power Query will enable query folding and thus off-load much of the data filtering burden to the data source.

## Next steps

In this article, you've learned how to use query folding in the Power Query connector for FHIR. Next, explore the list of FHIR Power Query folding patterns.

>[!div class="nextstepaction"]
>[FHIR Power Query folding patterns](fhir-queryfoldingpatterns.md)
