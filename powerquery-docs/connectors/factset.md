---
title: Power Query FactSet Enterprise connector
description: Provides basic information and prerequisites for the FactSet Enterprise connector, and includes descriptions of the optional input parameters.
author: eschmidtfds
ms.service: powerquery
ms.topic: concept-article
ms.date: 9/11/2025
ms.author: dougklo
ms.subservice: connectors
---

# FactSet

>[!Note]
>This connector is owned and provided by FactSet.

## Summary

| Item | Description |
| ------- | ------------ |
| Release state | General Availability |
| Products supported | Power BI (Semantic models)<br/>Power BI (Dataflows)<br/>Fabric (Dataflow Gen2) |
| Authentication types supported | API Key<br>Organizational account |
| Function reference documentation | https://developer.factset.com |

## Prerequisites

To start using the FactSet connector, the following prerequisite steps need to be completed.

* Download Power BI
  * Ensure that you are using the latest version of Power BI, as the latest major update to FactSet is only available there. Any subsequent major or minor version updates will only be available by upgrading Power BI.

* Subscription & Authentication
  * To access FactSet's data, the appropriate subscription is required. Contact your FactSet representative for more details.
  * With the subscription in place, the next step is to choose your authentication method. You can either generate an API key from the [Developer Portal](https://developer.factset.com/learn/authentication-api-key), or you can authenticate using the **Use FactSet Login** option (recommended).

## Connect to FactSet from Power BI Desktop

To import data using FactSet from Power Query Desktop, take the following steps:

1. **Open Power BI Desktop**

    On the Power BI Desktop home page, under section **"Get Data" -> "More…"**

    :::image type="content" source="./media/factset/open-power-bi.png" alt-text="Screenshot of the Get Data drop down box with the More option emphasized.":::

2. **Connect to FactSet**

    Search for **FactSet** in the **Get Data** pop-up and select the **FactSet** connector from the right-hand list.

    > [!NOTE]
    >  This connector serves as a unified solution, incorporating all the contents from previous FactSet connectors.

    :::image type="content" source="./media/factset/connect.png" alt-text="Screenshot of the Get Data dialog box with FactSet emphasized.":::

4. **Authentication page**

    You're prompted to sign in using your FactSet credentials. Alternatively, you can enter the Username - Serial and the API key. For more instructions on setting up an API key, go to the [FactSet Developer Portal](https://developer.factset.com/manage-api-keys).

    :::image type="content" source="./media/factset/authentication.png" alt-text="Screenshot of the Authentication dialog box with the FactSet Login highlighted.":::

5. **FactSet Navigator**

    FactSet opens a Navigator with a list of all functions provided. Note that all functions might not be available depending on your subscriptions; your account team can assist with requirements for access to additional products. Navigate to and select all the desired endpoint(s). Choose **Load** to import the data, or select **Transform Data** to proceed with data transformation in the Power Query editor.

    :::image type="content" source="./media/factset/navigator.png" alt-text="Screenshot of the Navigator dialog box with a list of all of the provided functions.":::

6. **Use Functions in FactSet**

    A form populates in the query window with parameter fields to guide you. You can use the [Developer Portal](https://developer.factset.com/api-catalog) for more detail on the types of values accepted for each parameter and detail about the responses.

7. **Result Format**

    Results are returned as a table and can be used to build your visualizations.
