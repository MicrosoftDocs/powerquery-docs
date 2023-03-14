---
title: Power Query connector certification submission
description: Instructions for submitting a Power Query custom connector for certification.
author: bezhan-msft
ms.topic: conceptual
ms.date: 3/13/2023
ms.author: bezhan
---

# Power Query connector submission

## Introduction

This article provides instructions for how to submit your Power Query custom connector for certification. Don't submit your connector for certification unless you've been explicitly directed to by your Microsoft contact.

## Prerequisites

After you've been approved for certification, ensure that your connector meets the [certification requirements](./connectorcertification.md#certification-requirements) and follows all feature, style, and security guidelines. Prepare the [submission artifacts](./connectorcertification.md#certification-requirements) for submission.

## Submitting to the Connector Certification Portal

The Connector Certification Portal is an experience within [ISV Studio](https://aka.ms/ISVStudio) that allows Microsoft partners and ISVs to submit, view, and manage connectors submitted for certification. After submission, communication between Microsoft and the partner connector developer will be through the Connector Certification Portal.

### Initial Submission

1. Navigate to [ISV Studio](https://aka.ms/ISVStudio) and sign in with your work Microsoft account. Personal accounts aren't supported in this experience.

2. Select the **Connector certification** tab on the left to launch the Connector Certification Portal experience.

3. Select **Power Query** as your connector type.

4. Read and agree to our connector Partner Agreement. If there's a separate agreement governing the relationship between your organization and Microsoft, let your Microsoft contact know.

5. Upload your `.mez` file and complete the form with information on your connector. Submit the form to finish the connector submission process. Once submitted, you can use the Activity Control experience on the right to communicate with your Microsoft contact.

6. Read the guidelines for providing [documentation](./providing-user-documentation.md) for your custom connector. Create a Markdown (`.md`) file following the custom connector documentation guidelines, using examples from existing documentation if needed. This step is crucial to ensure users know how to use your connector. Once you have the pull request for the public documentation available, email the pull request link to your Microsoft contact.

7. In the Activity Control, share a paragraph introducing your connector and explaining its value proposition to users and customers. This entry will be submitted as part of the Power BI blog in the upcoming month's post, announcing the release of your connector.

**Note that we need you to complete all the steps in order to move forward with certification.** If you would like to add teammates to manage your connector, let your Microsoft contact know.

After your connector code review is complete, you'll need to submit a demo video to us outlining the following scenarios:

- Load the connector as a custom connector in Power BI Desktop.
- Select the connector from **Get Data**.
- Successfully authenticate to the connector.
- Select a table from the **Navigator** experience.
- Load the data into Power BI Desktop and create a simple report.
- Publish the report to the Power BI service.
- Update the data in your end service backend (any simple data value update).
- Successfully refresh the dataset in the Power BI service using the connector through the on-premises data gateway. Refresh the report visual. The changed data value should be updated.
- Successfully refresh in Power BI Desktop. The changed data value should be updated.

### Updates

Updates to your connector submission can be made at any time, except when your connector is in the process of production deployment. When you're submitting an update, ensure that you submit an update to your existing submission, rather than creating a new submission.

1. Navigate to the **Connector certification** experience within [ISV Studio](https://aka.ms/ISVStudio).

2. From the list of connectors you manage, select the connector submission to view its connector versions.

3. For an update to a certified connector, select the link to submit a new version in the panel on the right, on top of the existing connector versions. For an update to an existing connector version undergoing certification, select the most recent connector version and on the bottom left, select the **Submit an update** button.

4. You can upload a new version of artifacts and complete the submission form again.

5. After submitting the connector form, in the **Activity Control** chat feature on the right, submit a short changelog explaining the connector update. This information should be public and written in a customer-facing way, as it will be included verbatim in the next Power BI Desktop blog update.

6. Also be sure to update your connector-specific documentation in the [connector reference](connectors/index.md). You can submit a pull request by selecting the pencil icon on the top right of the screen. Any functionality change should be accompanied by the corresponding documentation update.
