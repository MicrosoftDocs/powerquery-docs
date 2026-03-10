---
title: Include file for the Limitations and considerations section of the Power Query Microsoft Cost Management connector documentation
description: Include file for the Limitations and considerations section of the Power Query Microsoft Cost Management connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

The following considerations and limitations apply to the Microsoft Cost Management connector:

* The Microsoft Cost Management connector doesn’t support pay-as-you-go Microsoft Customer Agreements or indirect Microsoft Customer Agreements. Microsoft Partner Agreements are also not supported. If you have an unsupported agreement, you can use Exports to save the cost data to a share and then connect to it using Power BI. More information: [Tutorial - Create and manage exported data from Microsoft Cost Management](/azure/cost-management-billing/costs/tutorial-export-acm-data?tabs=azure-portal)

* The Microsoft Cost Management connector uses OAuth 2.0 for authentication with Azure and identifies users who are going to use the connector. Tokens generated in this process are valid for a specific period. Power BI preserves the token for the next sign in. OAuth 2.0, is a standard for the process that goes on behind the scenes to ensure the secure handling of these permissions. To connect, you must use an [Enterprise Administrator](/azure/billing/billing-understand-ea-roles) account for Enterprise Agreements, or have [appropriate permissions](/microsoft-365/commerce/billing-and-payments/manage-billing-profiles) at the billing account or billing profile levels for Microsoft Customer Agreements.

* Data row requests exceeding one million rows aren't supported by Power BI. Instead, you can try using the export feature described in [create and manage exported data in Cost Management](/azure/cost-management-billing/costs/tutorial-export-acm-data).

* The Microsoft Cost Management data connector doesn't work with Office 365 GCC customer accounts.

* **Data refresh:** The cost and usage data is typically updated and available in the Azure portal and supporting APIs within 8 to 24 hours, so we suggest you constrain Power BI scheduled refreshes to once or twice a day.

* **Data source reuse:** If you have multiple reports that are pulling the same data, and don't need extra report-specific data transformations, you should reuse the same data source, which would reduce the amount of time required to pull the Usage Details data.

  For more information on reusing data sources, go to:

  * [Introduction to semantic models across workspaces](/power-bi/connect-data/service-datasets-across-workspaces)
  * [Create reports based on semantic models from different workspaces](/power-bi/connect-data/service-datasets-discover-across-workspaces)

You might receive a *400 bad request* from the **RI usage details** when you try to refresh the data if you've chosen a date parameter greater than three months. To mitigate the error, take the following steps:

1. In Power BI Desktop, select **Home > Transform data**.

2. In Power Query Editor, select the **RI usage details** semantic model and select **Advanced Editor**.

3. To split the calls into three-month chunks, update the Power Query code as shown in the following sections. Make sure you note and retain your enrollment number, or billing account/billing profile ID.

   For **EA** use the following code update:
  
    ```powerquery-m
    let
        enrollmentNumber = "<<Enrollment Number>>",
        optionalParameters1 = [startBillingDataWindow = "-9", endBillingDataWindow = "-6"],
        source1 = AzureCostManagement.Tables("Enrollment Number", enrollmentNumber, 5, optionalParameters1),
        riusagedetails1 = source1{[Key="riusagedetails"]}[Data],
        optionalParameters2 = [startBillingDataWindow = "-6", endBillingDataWindow = "-3"],
        source2 = AzureCostManagement.Tables("Enrollment Number", enrollmentNumber, 5, optionalParameters2),    
        riusagedetails2 = source2{[Key="riusagedetails"]}[Data],
        riusagedetails = Table.Combine({riusagedetails1, riusagedetails2})
    in
        riusagedetails
    ```

    For **Microsoft Customer Agreements** use the following update:

    ```powerquery-m
    let
        billingProfileId = "<<Billing Profile Id>>",
        optionalParameters1 = [startBillingDataWindow = "-9", endBillingDataWindow = "-6"],
        source1 = AzureCostManagement.Tables("Billing Profile Id", billingProfileId, 5, optionalParameters1),
        riusagedetails1 = source1{[Key="riusagedetails"]}[Data],
        optionalParameters2 = [startBillingDataWindow = "-6", endBillingDataWindow = "-3"],
        source2 = AzureCostManagement.Tables("Billing Profile Id", billingProfileId, 5, optionalParameters2),    
        riusagedetails2 = source2{[Key="riusagedetails"]}[Data],
        riusagedetails = Table.Combine({riusagedetails1, riusagedetails2})
    in
        riusagedetails
    
    ```

4. Once you've updated the code with the appropriate update from the previous step, select **Done** and then select **Close & Apply**.
