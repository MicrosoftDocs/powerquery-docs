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

The list of examples in this document is not exhaustive and does not cover all the search parameters which queries will fold to. However, we provide examples of the types of queries and parameters you might encounter. When you are constructing a filter query expression, consider whether the parameter you would like to filter on is:

1. A primitive type (like `Patient.birthDate`)
1. A complex type property (like `Patient.meta.lastUpdated`)
1. A list (like `Patient.meta.profile`)
1. A table (like `Observation.code.coding`, which has a number of columns)

And then consult the list of examples below.

## Filtering on primitive types

Root properties are at the root of a resource and typically of a primitive type (string, date, etc.), but they can also be coding fields (e.g. `Encoding.class`). This section shows examples of searching different types of primitive root level properties.

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

<!-- 
    DOC: Folding Patient.gender (code)
-->

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

## Filtering on complex types

Filtering on last updated:

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

Filtering Encounter based on class system and code (coding):

<!-- 
    DOC: Folding Encounter.class system and code (coding)
-->

```M
let
    Encounters = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Encounter" ]}[Data],

    // Fold: "class=s|c"
    FilteredEncounters = Table.SelectRows(Encounters, each [class][system] = "s" and [class][code] = "c")
in
    FilteredEncounters
```

Filtering Encounter based on code (coding):

<!-- 
    DOC: Folding Encounter.class code only (coding)
-->

```M
let
    Encounters = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Encounter" ]}[Data],

    // Fold: "class=c"
    FilteredEncounters = Table.SelectRows(Encounters, each [class][code] = "c")
in
    FilteredEncounters
```

Filtering Encounter based on class system only (coding):

<!-- 
    DOC: Folding Encounter.class (coding)
-->

```M
let
    Encounters = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Encounter" ]}[Data],

    // Fold: "class=s|"
    FilteredEncounters = Table.SelectRows(Encounters, each [class][system] = "s")
in
    FilteredEncounters
```

Filter Observations based on `Observation.subject.reference` (reference):

<!-- 
    DOC: Folding Observation.subject.reference (reference)
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "subject=Patient/1234"
    FilteredObservations = Table.SelectRows(Observations, each [subject][reference] = "Patient/1234")
in
    FilteredObservations
```

Filter Observations based on variations in `Observation.subject.reference` (reference):

<!-- 
    DOC: Folding Observation.subject.reference ORs (reference)
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "subject=1234,Patient/1234,https://myfhirservice/Patient/1234"
    FilteredObservations = Table.SelectRows(Observations, each [subject][reference] = "1234" or [subject][reference] = "Patient/1234" or [subject][reference] = "https://myfhirservice/Patient/1234")
in
    FilteredObservations
```

Filtering on Quantity equal value (quantity):

<!-- 
    DOC: Folding ChargeItem.quantity.value (quantity)
-->

```M
let
    ChargeItems = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "ChargeItems" ]}[Data],

    // Fold: "quantity=1"
    FilteredChargeItems = Table.SelectRows(ChargeItems, each [quantity][value] = 1)
in
    FilteredChargeItems
```

Filtering on Quantity greater than value (quantity):

<!-- 
    DOC: Folding ChargeItem.quantity.value greater than (quantity)
-->

```M
let
    ChargeItems = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "ChargeItems" ]}[Data],

    // Fold: "quantity=gt1.001"
    FilteredChargeItems = Table.SelectRows(ChargeItems, each [quantity][value] > 1.001)
in
    FilteredChargeItems
```

Filtering on Quantity with value system and code (quantity):

<!-- 
    DOC: Folding ChargeItem.quantity.value value, system, code (quantity)
-->

```M
let
    ChargeItems = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "ChargeItems" ]}[Data],

    // Fold: "quantity=lt1.001|s|c"
    FilteredChargeItems = Table.SelectRows(ChargeItems, each [quantity][value] < 1.001 and [quantity][system] = "s" and [quantity][code] = "c")
in
    FilteredChargeItems
```

Filtering on period, starts after (period):

<!-- 
    DOC: Folding Consent.provision.period.start starts after (period)
-->

```M
let
    Consents = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Consents" ]}[Data],

    // Fold: "period=sa2010-01-01T00:00:00.000+00:00"
    FiltertedConsents = Table.SelectRows(Consents, each [provision][period][start] > #datetimezone(2010, 1, 1, 0, 0, 0, 0, 0))
in
    FiltertedConsents
```

Filtering on period, ends before (period):

<!-- 
    DOC: Folding Consent.provision.period.start ends before (period)
-->

```M
let
    Consents = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Consents" ]}[Data],

    // Fold: "period=eb2010-01-01T00:00:00.000+00:00"
    FiltertedConsents = Table.SelectRows(Consents, each [provision][period][end] < #datetimezone(2010, 1, 1, 0, 0, 0, 0, 0))
in
    FiltertedConsents
```
