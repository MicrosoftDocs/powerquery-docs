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
1. A complex type, which would be a record in Power Query (like `Patient.meta`)
1. An array of primitive types, which would be a list in Power Query (like `Patient.meta.profile`)
1. An array of complex types, which would be a table in Power Query (like `Observation.code.coding`, which has a number of columns)

And then consult the list of examples below. There also examples of combining these types of filtering patters in multi-level, nested filtering statements.

In each example you will find a filtering expression (`Table.SelectRows`) and right above each filtering statement a comment `// Fold: ...` explaining what search parameters and values the expression will fold to.

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

Filtering Patients by birth date range using `and`, only the 1970s:

<!-- 
    DOC: Folding Patient.date AND (date)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "birthdate=ge1970-01-01&birthdate=lt1980-01-01"
    FilteredPatients = Table.SelectRows(Patients, each [birthDate] < #date(1980, 1, 1) and [birthDate] >= #date(1970, 1, 1))
in
    FilteredPatients
```

Filtering Patients by birthdate using `or`, not the 1970s:

<!-- 
    DOC: Folding Patient.date OR (date)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "birthdate=ge1980-01-01,lt1970-01-01"
    FilteredPatients = Table.SelectRows(Patients, each [birthDate] >= #date(1980, 1, 1) or [birthDate] < #date(1970, 1, 1))
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

Filtering to keep only patients that are not male (includes other):

<!-- 
    DOC: Folding Patient.gender not male (code)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "gender:not=male"
    FilteredPatients = Table.SelectRows(Patients, each [gender] <> "male")
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

Filtering text field of complex types:

<!-- 
    DOC: Folding Observation.code.text, equal
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "code:text=t"
    FilteredObservations = Table.SelectRows(Observations, each [code][text] = "t")
in
    FilteredObservations
```

Filtering on text field (starts with):

<!-- 
    DOC: Folding Observation.code.text, startsWith
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "code:text=t"
    FilteredObservations = Table.SelectRows(Observations, each Text.StartsWith([code][text], "t"))
in
    FilteredObservations
```

## Filtering on lists properties

Filtering Patients on profile:

<!--
    DOC: Folding Patient.meta.profile
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "_profile=http://myprofile"
    FilteredPatients = Table.SelectRows(Patients, each List.MatchesAny([meta][profile], each _ = "http://myprofile"))
in
    FilteredPatients
```

Filtering AllergyIntolerance on category:

<!--
    DOC: Folding AllergyIntolerance.category
-->

```M
let
    AllergyIntolerances = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "AllergyIntolerance" ]}[Data],

    // Fold: "category=food"
    FilteredAllergyIntolerances = Table.SelectRows(AllergyIntolerances, each List.MatchesAny([category], each _ = "food"))
in
    FilteredAllergyIntolerances
```

Filtering AllergyIntolerance on missing category:

<!--
    DOC: Folding AllergyIntolerance.category missing
-->

```M
let
    AllergyIntolerances = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "AllergyIntolerance" ]}[Data],

    // Fold: "category:missing=true"
    FilteredAllergyIntolerances = Table.SelectRows(AllergyIntolerances, each List.MatchesAll([category], each _ = null))
in
    FilteredAllergyIntolerances
```

## Filtering on table properties

Filtering Patients on exact family name:

<!--
    DOC: Folding Patient.name.family (exact)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "family:exact=Johnson"
    FilteredPatients = Table.SelectRows(Patients, each Table.MatchesAnyRows([name], each [family] = "Johnson"))
in
    FilteredPatients
```

Filtering on Patients where family name starts with:

<!--
    DOC: Folding Patient.name.family (startsWith)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "family=John"
    FilteredPatients = Table.SelectRows(Patients, each Table.MatchesAnyRows([name], each Text.StartsWith([family], "John")))
in
    FilteredPatients
```

Filtering Patients on family name starts with `John` or `Paul`:

<!--
    DOC: Folding Patient.name.family (startsWith OR)
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "family=John,Paul"
    FilteredPatients = Table.SelectRows(Patients, each Table.MatchesAnyRows([name], each Text.StartsWith([family], "John") or Text.StartsWith([family], "Paul")))
in
    FilteredPatients
```

Filtering Patients on family name starts with `John` and given starts with `Paul`:

<!--
    DOC: Folding Patient.name.family and patient.name.given
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "family=John&given=Paul"
    FilteredPatients = Table.SelectRows(Patients, each Table.MatchesAnyRows([name], each Text.StartsWith([family], "John")) and Table.MatchesAnyRows([name], each List.MatchesAny([given], each Text.StartsWith(_, "Paul"))))
in
    FilteredPatients
```

Filtering on Goal due date:

<!--
    DOC: Folding Goal.target.due.date
-->

```M
let
    Goals = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Goal" ]}[Data],

    // Fold: "target-date=gt2020-03-01"
    FilteredGoals = Table.SelectRows(Goals, each Table.MatchesAnyRows([target], each [due][date] > #date(2020,3,1)))
in
    FilteredGoals
```

Filtering Patient on identifier:

<!--
    DOC: Folding Patient.identifier
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "identifier=s|v"
    FilteredPatients = Table.SelectRows(Patients, each Table.MatchesAnyRows([identifier], each [system] = "s" and _[value] = "v"))
in
    FilteredPatients
```

Filtering on Observation code (CodeableConcept):

<!--
    DOC: Folding Observation.code.coding
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "code=s|c"
    FilteredObservations = Table.SelectRows(Observations, each Table.MatchesAnyRows([code][coding], each [system] = "s" and [code] = "c"))
in
    FilteredObservations
```

Filtering on Observation code and text (CodeableConcept):

<!--
    DOC: Folding Observation.code.coding and Observation.code.text
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "code:text=t&code=s|c"
    FilteredObservations = Table.SelectRows(Observations, each Table.MatchesAnyRows([code][coding], each [system] = "s" and [code] = "c") and [code][text] = "t")
in
    FilteredObservations
```

## Filtering multi-level nested properties

Filtering Patients on family name starts with `John` and given starts with `Paul`:

<!--
    DOC: Folding Patient.name.family and patient.name.given
-->

```M
let
    Patients = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Patient" ]}[Data],

    // Fold: "family=John&given=Paul"
    FilteredPatients = Table.SelectRows(Patients, each Table.MatchesAnyRows([name], each Text.StartsWith([family], "John")) and Table.MatchesAnyRows([name], each List.MatchesAny([given], each Text.StartsWith(_, "Paul"))))
in
    FilteredPatients
```

Filtering only vital signs from Observations:

<!--
    DOC: Folding Observation.category.coding vital-signs
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "category=vital-signs"
    FilteredObservations = Table.SelectRows(Observations, each Table.MatchesAnyRows([category], each Table.MatchesAnyRows([coding], each [code] = "vital-signs")))
in
    FilteredObservations
```

Filtering Observations on category coding with system and code:

<!--
    DOC: Folding Observation.category.coding with system and code
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "category=s|c"
    FilteredObservations = Table.SelectRows(Observations, each Table.MatchesAnyRows([category], each Table.MatchesAnyRows([coding], each [system] = "s" and [code] = "c")))
in
    FilteredObservations
```

<!--
    DOC: Folding Observation.category.coding with system and code (OR)
-->

```M
let
    Observations = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "Observation" ]}[Data],

    // Fold: "category=s1|c1,s2|c2"
    FilteredObservations = Table.SelectRows(Observations, each Table.MatchesAnyRows([category], each Table.MatchesAnyRows([coding], each ([system] = "s1" and [code] = "c1") or ([system] = "s2" and [code] = "c2"))))
in
    FilteredObservations
```

Filtering nested list in table:

<!--
    DOC: Folding AuditEvent.agent.policy (nested list property)
-->

```M
let
    AuditEvents = Fhir.Contents("https://myfhirserver.azurehealthcareapis.com", null){[Name = "AuditEvent" ]}[Data],

    // Fold: "policy=http://mypolicy"
    FilteredAuditEvents = Table.SelectRows(AuditEvents, each Table.MatchesAnyRows([agent], each List.MatchesAny([policy], each _ = "http://mypolicy")))
in
    FilteredAuditEvents
```

## Summary

Query folding turns Power Query filtering expressions into FHIR search parameters. The FHIR Power Query connector recognizes certain patterns and attempts to identify matching search parameters. Recognizing those patterns will help you write more efficient Power Query expressions.

## Next steps

In this article, we reviewed some classes of filtering expressions that will fold to FHIR search parameters. Next read about establishing relationships between FHIR resources.

>[!div class="nextstepaction"]
>[FHIR Power Query relationships](FHIR-Relationships.md)