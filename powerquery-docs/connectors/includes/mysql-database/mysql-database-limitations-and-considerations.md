---
title: Include file for the Limitations and considerations section of the Power Query MySQL Database connector documentation
description: Include file for the Limitations and considerations section of the Power Query MySQL Database connector documentation
author: whhender
ms.author: whhender
ms.date: 03/06/2026
ms.topic: include
---

The following limitations apply to the Power Query MySQL database connector.

### MySQL connections can't be used with personal gateways

If the MySQL database isn't accessible from the cloud, configure MySQL on-premises connections by upgrading to a standard mode on-premises data gateway instead of using a personal on-premises data gateway. For cloud-based MySQL servers, a gateway isn't required.

### It isn't possible to mashup MySQL on-premises data with R and Python

For cases where Python or R is used with a MySQL database on-premises connection, use one of the following methods:

* Make the MySQL server database accessible from the cloud.
* Move the MySQL on-premises data to a different dataset and use the Enterprise Gateway exclusively for that purpose. 

### Unsupported regions

The MySQL connector doesn't support China Cloud for Power Apps, Power Automate and Logic Apps. Refer to [MySQL connector](/connectors/mysql) for those products.
