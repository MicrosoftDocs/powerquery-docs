---
title: FHIR Power Query Folding Patterns
description: FHIR Power Query connector query folding patterns
author: hansenms
ms.service: powerquery
ms.topic: conceptual
ms.date: 01/08/2020
ms.author: mihansen
LocalizationGroup: reference
---

# FHIR Query Folding Patterns

This article describes Power Query patterns that will allow effective query folding in FHIR. It assumes that you are familiar with with using the [FHIR Power Query connector](FHIR.md) and understand the basic motivation and principles for [Power Query folding in FHIR](FHIR-QueryFolding.md).

## How to use this document

The list of examples in this document is not exhaustive and does not cover all the search parameters which queries will fold to. When you are constructing a query think about whether the parameter you would like to filter on is:

1. A primitive root property (like `Patient.birthDate`)
1. A member of a record (like `Patient.meta.lastUpdated`)
1. A list (like `Patient.meta.profile`)
1. A table (like `Observation.code.coding`, which has a number of columns)

## Filtering on primitive root properties

Root properties are primitive type (string, date, etc.) fields at the root of a resource. Many of them support folding. This section shows examples of searching different types of primitive root level properties.

Filtering patients by birth date:

<!-- 
    DOC: Folding Patient.date (date)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "birthdate=lt1980-01-01"
    FilteredPatients = Table.SelectRows(Patients, each [birthDate] < #date(1980, 1, 1))
in
    FilteredPatients
```

Filtering for active (boolean) patients:

<!-- 
    DOC: Folding Patient.active (boolean)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "active:missing=false&active=true"
    FilteredPatients = Table.SelectRows(Patients, each [active] <> null and [active] = true)
in
    FilteredPatients
```

Alternative search for active patients:

<!-- 
    DOC: Folding Patient.active (boolean) interpreted as true
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "active=true"
    FilteredPatients = Table.SelectRows(Patients, each [active])
in
    FilteredPatients
```

Alternative search for patients where active not true (could include missing):

<!-- 
    DOC: Folding Patient.active (boolean) interpreted as true
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "active:not=true"
    FilteredPatients = Table.SelectRows(Patients, each [active] <> true)
in
    FilteredPatients
```

Filtering to keep only male patients:

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "gender=male"
    FilteredPatients = Table.SelectRows(Patients, each [gender] = "male")
in
    FilteredPatients
```

Filtering Observations with status final (code):

<!-- 
    DOC: Folding Observation.status (code)
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "status=final"
    FilteredObservations = Table.SelectRows(Observations, each [status] = "final")
in
    FilteredObservations
```

## Filtering on record property field

Records in Power Query are a collection of fields, an example would the the `meta` field, which is present on all resources. This section shows examples of searching property fields:

Searching on nested property:

<!--
    DOC: Folding Patient._lastUpdated (instant)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "_lastUpdated=2010-12-31T11:56:02.000+00:00"
    FilteredPatients = Table.SelectRows(Patients, each [meta][lastUpdated] = #datetimezone(2010, 12, 31, 11, 56, 2, 0, 0))
in
    FilteredPatients
```

