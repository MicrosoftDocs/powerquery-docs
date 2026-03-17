---
title: Include file for the Prerequisites section of the Power Query Excel connector documentation
description: Include file for the Prerequisites section of the Power Query Excel connector documentation
author: whhender
ms.author: whhender
ms.date: 03/06/2026
ms.topic: include
---

To connect to a legacy workbook (such as .xls or .xlsb), the Access Database Engine OLEDB (or ACE) provider is required. To install this provider, go to the [download page](/power-bi/connect-data/desktop-access-database-errors) and install the relevant (32 bit or 64 bit) version. If it isn't installed, the following error is displayed when connecting to legacy workbooks:

```The 'Microsoft.ACE.OLEDB.12.0' provider is not registered on the local machine. The 32-bit (or 64-bit) version of the Access Database Engine OLEDB provider may be required to read this type of file. To download the client software, visit the following site: https://go.microsoft.com/fwlink/?LinkID=285987.```

ACE can't be installed in cloud service environments. So if you're seeing this error in a cloud host (such as Power Query Online), you must use a gateway that has ACE installed to connect to the legacy Excel files.

