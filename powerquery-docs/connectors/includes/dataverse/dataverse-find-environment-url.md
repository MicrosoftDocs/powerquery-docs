---
title: Include file for the Finding your Dataverse environment URL section of the Power Query Dataverse connector documentation
description: Include file for the Finding your Dataverse environment URL section of the Power Query Dataverse connector documentation
ms.reviewer: whhender
ms.date: 03/17/2026
ms.topic: include
---

If you need to use port 5558 to connect to Dataverse, you have to find your Dataverse environment URL. Open [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc). In the upper right of the Power Apps page, select the environment you're going to connect to. Select the :::image type="content" source="/power-query/connectors/media/common-data-service/settings-icon.png" alt-text="Settings icon."::: settings icon, and then select **Advanced settings**.

In the new browser tab that opens, copy the root of the URL. This root URL is the unique URL for your environment. The URL is in the format of https://<*yourenvironmentid*>.crm.dynamics.com/. **Make sure you remove https:// and the trailing / from the URL before pasting it to connect to your environment.** Append port 5558 to the end of the environment URL, for example *yourenvironmentid.crm.dyamics.com,5558*.

:::image type="content" source="/power-query/connectors/media/dataverse/cds-env.png" alt-text="Location of the Dataverse environment URL.":::
