---
title: Power Query inwink connector (Beta)
description: Provides basic information and prerequisites for the connector, descriptionson how to connect to the inwink connector.
author: paservois
ms.author: 
ms.topic: conceptual
ms.date: 5/9/2023
---

# inwink Connector (Beta)
 
## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (datasets)<br/>Power BI (Dataflows) |
| Authentication Types Supported | Organizational account |

## Prerequisites
Before you can sign in to inwink Connector, you must have an inwink account (username/password).

 
## Connect to inwink data

To connect to inwink data:

1. Select **Get Data** from the **Home** ribbon in Power BI Desktop. Select **Online Services** from the categories on the left, select **inwink**, and then select **Connect**.
![Get Data from inwink](./media/inwink/get-data.png)

2. Provide your inwink customer ID, the scope you want to retrieve data from (Event, Community or Audience) and the scope ID
![Select scope](./media/inwink/select-scope.png)

3. Sign in to your inwink account, select **Sign in**.
![Authentication step 1](./media/inwink/auth1.png)

4. Connect using your user email and password
![Authentication step 2](./media/inwink/auth2.png)

5. Once the connection is established, you can preview and select Tables within the **Navigator**. 
![Select tables](./media/inwink/nav-data.png)

You can **Load** the selected tables, which brings the entire tables into Power BI Desktop, or you can select **Transform Data** to edit the query, which opens Power Query Editor. You can then filter and refine the set of data you want to use, and then load that refined set of data into Power BI Desktop.



## Limitations and issues

Table relationships may be automatically set by Power BI Desktop when loading the tables and induce errors. Delete all relationships on column 'Status'