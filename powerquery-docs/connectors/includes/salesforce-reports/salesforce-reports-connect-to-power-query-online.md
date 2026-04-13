---
title: Include file for the Connect to Power Query Online section of the Power Query Salesforce Reports connector. connector documentation
description: Include file for the Connect to Power Query Online section of the Power Query Salesforce Reports connector. connector documentation
ms.date: 03/06/2026
ms.topic: include
---

To connect to Salesforce Reports data:

1. Select **Salesforce reports** from the product-specific data connector list, and then select **Connect**. For more information, go to [Where to get data](/power-query/where-to-get-data).

2. In **Salesforce reports**, choose the URL you want to use to connect. Select the **Production** URL if you use the Salesforce production URL (`https://www.salesforce.com`) to sign in.

   :::image type="content" source="/power-query/connectors/media/salesforce-reports/sf-reports-url-online.png" alt-text="Screenshot of the Connect to data source window where you add Salesforce Reports connection information.":::

   > [!NOTE]
   >Currently, you might need to select the **Custom** URL, enter **`https://www.salesforce.com`** in the text box, and then select **Production** to connect to your data.

   You can also select **Custom** and enter a custom URL to sign in. This custom URL might be a custom domain you created within Salesforce, such as `https://contoso.salesforce.com`. You can also use the custom URL selection if you're using your own CNAME record that redirects to Salesforce.

   Also, you can select **Include relationship columns**. This selection alters the query by including columns that might have foreign-key relationships to other tables. If this box is unchecked, you don't see those columns.

3. If you're making this connection for the first time, select an on-premises data gateway, if needed.

4. Select **Sign in** to sign in to your Salesforce account. Once you successfully sign in, select **Next**.

5. In the **Navigator** dialog box, select the Salesforce Reports you want to load. Then select **Transform Data** to transform the data.

