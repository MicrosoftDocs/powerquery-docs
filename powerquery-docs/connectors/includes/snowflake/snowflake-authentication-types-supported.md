---
title: Include file for the authentication section of the Power Query Snowflake connector documentation
description: Include file for the authentication section of the Power Query Snowflake connector documentation
ms.date: 04/09/2026
ms.topic: include
---

> [!NOTE]
> - Username/password authentication mode will be deprecated by Snowflake (read [more here](https://www.snowflake.com/en/blog/blocking-single-factor-password-authentification/)). More information can be found under Connectivity on our [Fabric roadmap](https://roadmap.fabric.microsoft.com/?product=datafactory).
>
> - Key Pair Auth is not supported for Dataflows Gen1, and there are no plans to change this in the future.

The Snowflake connector supports the following authentication methods:

- **Microsoft Entra ID (recommended)**: Enables strong, identity-based authentication without storing usernames or passwords.  
   - In **Microsoft Fabric**, this authentication method can be backed by **workspace identity** in supported experiences (such as **Datasets** and **Dataflows Gen2**), allowing Fabric to authenticate to Snowflake using the workspace’s managed identity.

- **Workspace Identity**: A managed identity associated with a Microsoft Fabric workspace. When using Microsoft Entra ID authentication, supported Fabric experiences (such as Datasets and Dataflows Gen2) can use the workspace identity to authenticate to Snowflake. This allows Fabric to access Snowflake using an identity tied to the workspace, rather than individual user credentials.

- **Key pair authentication (ADBC)**: Certificate-based authentication for supported scenarios.

- **Service Principal (SPN)**: Supported with Snowflake for scenarios where a non-user, application-level identity is required. Support is dependent on Snowflake configuration and the authentication method used.
