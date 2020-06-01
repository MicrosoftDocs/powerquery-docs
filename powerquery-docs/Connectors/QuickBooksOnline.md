---
title: QuickBooks Online
description: Power Query QuickBooks Online connector reference
author: dougklopfenstein

ms.service: powerquery
ms.topic: conceptual
ms.date: 06/01/2020
ms.author: v-douklo

LocalizationGroup: reference
---

# QuickBooks Online

## Summary

Power BI QuickBooks Online connector enables connecting to your QuickBooks Online account and viewing, analysing, and reporting on your company QuickBooks data in Power BI.

Release state: Beta

Products: Power BI Desktop, Power BI Service (Enterprise Gateway)

Authentication Types Supported: QuickBooks Online account

## Prerequisites

To use the QuickBooks Online connector, you must have a QuickBooks Online account username and password.

The QuickBooks Online connector uses the QuickBooks ODBC driver. The QuickBooks ODBC driver is shipped with Power BI Desktop and no additional installation is required.

## Capabilities Supported

* Import

## Connect to QuickBooks Online

To connect to QuickBooks Online:

1. In the **Get Data** dialog box, enter **QuickBooks** in the **Search** box, select **QuickBooks Online (Beta)** from the product specific data connector list, and then select **Connect**.

   ![Get data from QuickBooks Online](media/quickbooks-online/qb-get-data.png)
   
2. Select **Continue** in the **Preview connector** message.

   ![Preview connector](media/quickbooks-online/qb-preview-connector.png)

3. Select **Sign in** to sign into your QuickBooks Online account.

   ![Sign in to your account](media/quickbooks-online/qb-signin.png)

4. In the following dialog enter your QuickBooks credentials. You may be required to provide 2FA (two factor authentication code) as well.

   ![Enter your credentials](media/quickbooks-online/qb-intuit-signin.png)

5. In the following dialog select a company and then select **Next**.

   ![Select a company](media/quickbooks-online/qb-select-company.png)

6. Once you have successfully signed in, select **Connect**.

   ![Connect to QuickBooks Online](media/quickbooks-online/qb-connect.png)

7. In the **Navigator** dialog box, select the QuickBooks tables you want to load. You can then either load or transform the data.

   ![Select QuickBooks tables](media/quickbooks-online/qb-navigator-window.png)

8. Create a report.

   ![Create a report](media/quickbooks-online/qb-sample-report.png)

9. Optionally, publish to Power BI service.

   ![Publish to Power BI service](media/quickbooks-online/qb-publish.png)

10. View the report in Power BI service.

    ![View the report](media/quickbooks-online/qb-view-report.png)

## Next steps

* [QuickBooks Power BI integration](https://powerbi.microsoft.com/integrations/quickbooks-online/)