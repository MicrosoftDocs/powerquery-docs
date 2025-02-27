---
title: Power Query Azure Analysis Services database connector
description: Includes basic information about products that use the Azure Analysis Services database connector, supported authentication types, prerequisites, and connection instructions.
author: dougklopfenstein
ms.topic: conceptual
ms.date: 1/18/2024
ms.author: dougklo
LocalizationGroup: reference
ms.subservice: connectors
---

# Azure Analysis Services database

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2)<br/>Power Apps (Dataflows)<br/>Dynamics 365 Customer Insights |
| Authentication Types Supported | Basic (suported in Power Apps only)<br/>Microsoft account<br/>Organizational account<br/>Windows (supported in Power Apps only) |
| M Function Reference | [AnalysisServices.Database](/powerquery-m/analysisservices-database)<br/>[AnalysisServices.Databases](/powerquery-m/analysisservices-databases) |

> [!NOTE]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

* An Azure subscription. Go to [Get Azure free trial](https://azure.microsoft.com/pricing/free-trial/).

* An Azure Analysis Services server. Follow the instructions at [Quickstart: Create a server - Portal](/azure/analysis-services/analysis-services-create-server) for creating the server using the Azure portal. Other articles in this section also include information on creating a server using PowerShell, Bicep, or an Azure Resource Manager (ARM) template. This connector article assumes that you've already created an Azure Analysis Services server and have an existing database on the server.

## Capabilities Supported

* Import
* Connect live (Power BI semantic models)
* Advanced options
  * MDX or DAX query

## Connect to Azure Analysis Services database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **Azure Analysis Services database** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

2. In the **SQL Server Analysis Services database** dialog that appears, provide the name of the server and database (optional).

   :::image type="content" source="./media/azure-analysis-services/select-database-desktop.png" alt-text="SQL Server database connection builder in Power Query Desktop.":::

   > [!NOTE]
   > Only Power BI Desktop will display the **Import** and **Connect live** options. If you're connecting using Power BI Desktop, selecting **Connect live** uses a live connection to load the connected data directly to Power BI Desktop. In this case, you can't use Power Query to transform your data before loading the data to Power BI Desktop. For the purposes of this article, the **Import** option is selected. For more information about using a live connection in Power BI Desktop, go to [Connect to Analysis Services tabular data in Power BI Desktop](/power-bi/connect-data/desktop-analysis-services-tabular-data).

3. Select **OK**.

4. If you're connecting to this database for the first time, select the authentication type and input your credentials. Then select **Connect**.

   :::image type="content" source="./media/azure-analysis-services/credentials-desktop.png" alt-text="Analysis Services database authentication.":::

5. In **Navigator**, select the database information you want, then either select **Load** to load the data or **Transform Data** to continue transforming the data in the Power Query editor.

   :::image type="content" source="./media/azure-analysis-services/navigator-desktop.png" lightbox="./media/azure-analysis-services/navigator-desktop.png" alt-text="Power Query Navigator showing some of the Sales Targets data.":::
## Connect to Azure Analysis Services database from Power Query Online

To make the connection, take the following steps:

1. Select the **Azure Analysis Services database** option in the connector selection. More information: [Where to get data](../where-to-get-data.md)

2. In the **Connect to data source** page, provide the name of the server and database (optional).

   :::image type="content" source="./media/azure-analysis-services/connection-settings-credentials.png" alt-text="Azure Analysis Services database connection builder in Power Query Online.":::

3. If needed, select an on-premises data gateway.

4. If you're connecting to this database for the first time, select the authentication kind and input your credentials.

5. Select **Next** to continue.

6. In **Navigator**, select the data you require, and then select **Transform data**.

   :::image type="content" source="./media/azure-analysis-services/navigator-online.png" lightbox="./media/sql-server-analysis-services/navigator-online.png" alt-text="Power Query Online Navigator showing the Human Resources employee data.":::
## Connect using advanced options

Power Query provides an advanced option that you can add to your query if needed.

| Advanced option | Description |
| --------------- | ----------- |
| MDX or DAX statement | Optionally provides a specific MDX or DAX statement to the Azure Analysis Services database server to execute. |

Once you've entered a value in the advanced option, select **OK** in Power Query Desktop or **Next** in Power Query Online to connect to your Azure Analysis Services database.

## Connect using Direct Query for composite models

It's possible to convert an Azure Analysis Services Live Connect model on Power BI into a DirectQuery composite model in order to combine the data from the Azure Analysis Services cube with other data in DirectQuery or import mode from other sources. Report authors who want to combine the data from their enterprise Azure Analysis Services models with other data they own, such as an Excel spreadsheet, or want to personalize or enrich the metadata from their enterprise AAS model, will find this functionality especially useful. Refer to [Composite models on Power BI semantic models and Analysis Services](/power-bi/transform-model/desktop-composite-models#composite-models-on-power-bi-semantic-models-and-analysis-services) for additional details.

## Troubleshooting

### Error indicates “invalid credentials”

If you've enabled the firewall in Azure Analysis Services and you're getting an “invalid credentials” error, you might need to allowlist the IP addresses of the Power Query Online clusters, even if you've allowed access from the Power BI service in your Azure Analysis Services server firewall.

:::image type="content" source="./media/azure-analysis-services/aas-firewall-settings.png" alt-text="screenshot.":::

To allowlist the Power Query Online clusters, download the Azure IP ranges and service tags from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=56519). You'll need to allowlist the IP addresses from the **PowerQueryOnline** service tag. For more information on how to configure the server firewall, go to [Quickstart: Configure server firewall - Portal](/azure/analysis-services/analysis-services-qs-firewall).
