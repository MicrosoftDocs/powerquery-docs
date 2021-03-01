---
title: Power Query connector certification submission
description: Instructions for submitting a Power Query custom connector for certification.
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 03/01/2020
ms.author: bezhan

LocalizationGroup: reference
---

# Power Query connector submission

## Introduction

This article provides instructions for how to submit your Power Query custom connector for certification. Do not submit your connector for certification unless you've been directed to by your Microsoft contact.

## Prerequisites

After you've been approved for certification, ensure that your connector meets the [certification requirements](https://docs.microsoft.com/power-query/connectorcertification#certification-requirements) and follows all feature, style, and security guidelines. Prepare the [submission artifacts](https://docs.microsoft.com/power-query/connectorcertification#certification-requirements) for submission.

## Submitting to the Connector Certification Portal

The Connector Certification Portal is an experience within [ISV Studio](https://aka.ms/ISVStudio) that allows Microsoft partners and ISVs to submit, view, and manage connectors submitted for certification. After submission, communication between Microsoft and the partner connector developer will be through the Connector Certification Portal.

### Initial Submission

1. Navigate to [ISV Studio](https://aka.ms/ISVStudio) and log in with your work Microsoft account. Personal accounts aren't supported in this experience.

2. Select the **Connector certification** tab on the left to launch the Connector Certification Portal experience.

3. Select **Power Query** as your connector type.

4. Read and agree to our connector Partner Agreement. If there is a separate agreement governing the relationship between your organization and Microsoft, let your Microsoft contact know.

5. Upload your `.mez` file and complete the form with information on your connector. Submit the form to finish the connector submission process. Once submitted, you can use the Activity Control experience on the right to communicate with your Microsoft contact. 

6. Read the guidelines for providing [documentation](https://docs.microsoft.com/power-query/providing-user-documentation) for your custom connector. Submit a pull request to our public [documentation repository](https://github.com/MicrosoftDocs/powerquery-docs/tree/master/powerquery-docs/Connectors) with an `.md` file following the custom connector documentation guidelines. This step is crucial to ensure users know how to use your connector. Once the pull request has been made, send a link to the pull request in the Activity Control experience in the Connector Certification Portal. 

7. If you would like to add teammates to manage your connector, let your Microsoft contact know.

### Updates

Updates to your connector submission can be made at any time, except when your connector is in the process of production deployment. When you are submitting an update, ensure that you submit an update to your existing submission, rather than creating a new submission.

1. Navigate to the **Connector certification** experience within [ISV Studio](https://aka.ms/ISVStudio).

2. From the list of connectors you manage, select the connector submission to view its connector versions.

3. Select the most recent connector version.

4. At the bottom left, select the "Submit an update" button. 

5. You can upload a new version of artifacts and complete the submission form again.

6. After submitting the connector form, within the Activity Control chat feature on the right, submit a short changelog explaining the connector update. This information should be public and written in a customer-facing way, as it will be included in the next Power BI Desktop blog update. 

