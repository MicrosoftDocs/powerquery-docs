---
title: Azure Cost Management connector
description: Includes basic information, prerequisites, and information on how to connect to Azure Cost Management.
author: whhender
ms.topic: concept-article
ms.date: 1/24/2024
ms.author: whhender
ms.subservice: connectors
---

# Azure Cost Management connector

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication Types Supported | Organizational Account |
| Function Reference Documentation | &mdash; |

> [!NOTE]
> This connector replaces the previously available Azure Consumption Insights and Azure Cost Management (Beta) connectors. Any reports created with the previous connector must be recreated using this connector.

## Prerequisites

[!INCLUDE [Includes_azure-cost-management_prerequisites](includes/azure-cost-management/azure-cost-management-prerequisites.md)]

## Capabilities supported

[!INCLUDE [Includes_azure-cost-management_capabilities-supported](includes/azure-cost-management/azure-cost-management-capabilities-supported.md)]

## Connect to Azure Cost Management from Power Query Desktop

To connect to **Azure Cost Management**:

1. In the **Home** ribbon, select **Get Data**.

2. Select **Azure** from the list of data categories.

3. Select **Azure Cost Management**.

    :::image type="content" source="media/azure-cost-management/get-data.png" alt-text="Get data.":::

4. In the dialog that appears, for the **Choose Scope** drop down, use **Manually Input Scope** for **Microsoft Customer Agreements**, or use **Enrollment Number** for **Enterprise Agreements (EA)**.

## Connect to a Microsoft Customer Agreement account

This section describes the steps necessary to connect to a Microsoft Customer Agreement account.

### Connect to a billing account

To connect to a billing account, you need to retrieve your **Billing account ID** from the Azure portal:

1. In the [Azure portal](https://portal.azure.com/), navigate to **Cost Management + Billing**.

2. Select your Billing profile.

3. Under **Settings** in the menu, select **Properties** in the sidebar.

4. Under **Billing profile**, copy the **ID**.

    :::image type="content" source="media/azure-cost-management/billing-profile.png" alt-text="Screenshot of Cost management billing profile.":::

5. For **Choose Scope**, select **Manually Input Scope** and input the connection string as shown in the following example, replacing *{billingAccountId}* with the data copied from the previous steps.

    `/providers/Microsoft.Billing/billingAccounts/{billingAccountId}`

    Alternatively, for **Choose Scope**, select **Enrollment Number** and input the Billing Account ID string as copied from the previous steps.

6. Enter the number of months and select **OK**.

    :::image type="content" source="media/azure-cost-management/number-of-months.png" alt-text="Screenshot of Azure Cost Management with number of months input.":::

    Alternatively, if you want to download less than a month's worth of data you can set *Number of months* to zero, then specify a date range using *Start Date* and *End Date* values that equate to less than 31 days.

7. When prompted, sign in with your Azure user account and password. You must have access to the Billing account scope to successfully access the billing data.

### Connect to a billing profile

To connect to a **billing profile**, you must retrieve your **Billing profile ID** and **Billing account ID** from the Azure portal:

1. In the [Azure portal](https://portal.azure.com/), navigate to **Cost Management + Billing**.

2. Select your Billing profile.

3. Under **Settings** in the menu, select **Properties** in the sidebar.

4. Under **Billing profile**, copy the **ID**.

5. Under **Billing account**, copy the **ID**.

    :::image type="content" source="media/azure-cost-management/copy-id.png" alt-text="Screenshot of Azure Cost Management billing account information.":::

6. For **Choose Scope**, select **Manually Input Scope** and input the connection string as shown in the example below, replacing *{billingAccountId}* and *{billingProfileId}* with the data copied from the previous steps.

    `/providers/Microsoft.Billing/billingAccounts/{billingAccountId}/billingProfiles/{billingProfileId}`

7. Enter the number of months and select **OK**.

8. When prompted, sign in with your Azure user account and password. You must have access to the Billing profile to successfully access the billing profile data.

## Connect to an Enterprise Agreement account

To connect with an Enterprise Agreement (EA) account, you can get your enrollment ID from the Azure portal:

1. In the [Azure portal](https://portal.azure.com/), navigate to **Cost Management + Billing**.

2. Select your billing account.

3. On the **Overview** menu, copy the **Billing account ID**.

4. For **Choose Scope**, select **Enrollment Number** and paste the billing account ID from the previous step.

5. Enter the number of months and then select **OK**.

    :::image type="content" source="media/azure-cost-management/get-data-enterprise-agreement.png" alt-text="Screenshot shows the Azure Cost Management properties with a scope of Enrollment number.":::

6. When prompted, sign in with your Azure user account and password. You must use an Enterprise Administrator account for Enterprise Agreements.

## Data available through the connector

Once you successfully authenticate, a **Navigator** window appears with the following available data tables:

| **Table** | **Description** |
| --- | --- |
| **Balance summary** | Summary of the balance for the current billing month for Enterprise Agreements (EA). |
| **Billing events** | Event log of new invoices, credit purchases, etc. Microsoft Customer Agreement only. |
| **Budgets** | Budget details to view actual costs or usage against existing budget targets. |
| **Charges** | A month-level summary of Azure usage, Marketplace charges, and charges billed separately. Microsoft Customer Agreement only. |
| **Credit lots** | Azure credit lot purchase details for the provided billing profile. Microsoft Customer Agreement only. |
| **Pricesheets** | Applicable meter rates for the provided billing profile or EA enrollment. |
| **RI charges** | Charges associated to your Reserved Instances over the last 24 months. This table is in the process of being deprecated. Instead, use RI transactions |
| **RI recommendations (shared)** | Reserved Instance purchase recommendations based on all your subscription usage trends for the last 30 days. |
| **RI recommendations (single)** | Reserved Instance purchase recommendations based on your single subscription usage trends for the last 30 days. |
| **RI transactions** | List of transactions for reserved instances on billing account scope. |
| **RI usage details** | Consumption details for your existing Reserved Instances over the last month. |
| **RI usage summary** | Daily Azure reservation usage percentage. |
| **Usage details** | A breakdown of consumed quantities and estimated charges for the given billing profile on EA enrollment. |
| **Usage details amortized** | A breakdown of consumed quantities and estimated amortized charges for the given billing profile on EA enrollment. |

You can select a table to see a preview dialog. You can select one or more tables by selecting the boxes beside their name. Then either select **Load** to load the data or **Transform Data** to continue transforming the data in Power Query Editor.

:::image type="content" source="media/azure-cost-management/navigator-enrollment.png" alt-text="Screenshot shows the Navigator dialog box.":::

When you select **Load**, the data is loaded into Power BI Desktop.

When the data you selected is loaded, the data tables and fields are shown in the **Fields** pane.

## Limitations and considerations

[!INCLUDE [Includes_azure-cost-management_limitations-and-considerations](includes/azure-cost-management/azure-cost-management-limitations-and-considerations-include.md)]
