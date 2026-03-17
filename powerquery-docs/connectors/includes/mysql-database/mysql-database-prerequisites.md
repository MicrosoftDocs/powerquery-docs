---
title: Include file for the Prerequisites section of the Power Query MySQL database connector documentation
description: Include file for the Prerequisites section of the Power Query MySQL database connector documentation
ms.date: 03/06/2026
ms.topic: include
---

You need to install the [Oracle MySQL Connector/NET](https://dev.mysql.com/downloads/connector/net/) package before using this connector in Power BI Desktop. For Power Query Online (dataflows) or Power BI service, if your MySQL server isn't cloud accessible and an on-premises data gateway is needed, the component Oracle MySQL Connector/NET must also be correctly installed on the machine running the on-premises data gateway. To determine if the package is installed correctly, open a PowerShell window and run the following command:

`[System.Data.Common.DbProviderFactories]::GetFactoryClasses()|ogv`

If the package is installed correctly, the MySQL Data Provider is displayed in the resulting dialog. For example:

:::image type="content" source="../../media/mysql-database/data-provider.png" alt-text="Screenshot of the data provider dialog with the MySQL data provider emphasized." lightbox="../../media/mysql-database/data-provider.png":::

If the package doesn't install correctly, work with your MySQL support team or reach out to MySQL.

> [!NOTE]
> The MySQL connector isn't supported on the **Personal Mode** of the on-premises data gateway. It's only supported on the on-premises data gateway **(standard mode)**

