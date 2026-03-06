---
title: Include file for the Prerequisites section of the Power Query PostgreSQL connector documentation
description: Include file for the Prerequisites section of the Power Query PostgreSQL connector documentation
ms.reviewer: whhender
ms.date: 03/06/2026
ms.topic: include
---

Power BI Desktop has included the Npgsql provider for PostgreSQL connector since December 2019, eliminating the need for additional installation. Starting with the October 2024 version, it incorporates Npgsql version 4.0.17. Separate Npgsql GAC installation will override this default version.

The PostgreSQL connector is supported for cloud connection and via VNet data gateway or on-premises data gateway. Since the June 2025 release, the on-premises data gateway includes the Npgsql provider, so no extra installation is needed. Separate Npgsql GAC installation will override this default version.

For Power BI Desktop versions released before December 2019 and on-premises data gateway released before June 2025, you must install the Npgsql provider on your local machine to use the PostgreSQL connector. To install the Npgsql provider, go to the [releases page](https://github.com/npgsql/npgsql/releases/tag/v4.0.17) for version 4.0.17, download and run the .msi file. The provider architecture (32-bit or 64-bit) needs to match the architecture of the product where you intend to use the connector. When installing, make sure that you select Npgsql GAC Installation to ensure Npgsql itself is added to your machine. Npgsql 4.1 and up are not supported due to .NET version incompatibilities.

:::image type="content" source="../../media/postgresql/postgres-1.png" alt-text="Screenshot of the Npgsql installer with GAC Installation selected.":::

