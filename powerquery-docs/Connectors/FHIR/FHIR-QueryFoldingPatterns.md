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

> TODO: Description of pattern organization

## Filtering on root properties

Searching for patients by birth date:

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

> TODO: Add More folding pattern examples 
