---
title: Security roles and permission levels in standard dataflows
description: Describes the security roles and permission levels used in standard dataflows.
author: bensack
ms.topic: conceptual
ms.date: 6/14/2023
ms.author: bensack
---

# Security roles and permission levels in standard dataflows



If someone in the team has created a dataflow and wants to share it with other team members, how does it work? What are the roles and permission level options available? This article takes you through the roles and permission levels related to standard dataflows.

## Access to the environment

A standard dataflow stores data in Dataverse. Dataverse is located in an environment. Before accessing data stored in Dataverse, and also dataflows, you first need to have access to the environment.

> [!div class="mx-imgBorder"]
> ![Image demonstrating how to add a user to the environment.](/power-platform/admin/media/add-user.png)

## Roles

There are multiple roles used to configure the security level for standard dataflows. The following table describes each role, along with the level of permission associated with that role.

| Security role              | Privileges                     | Description                                                  |
| -------------------------- | ------------------------------ | ------------------------------------------------------------ |
| Environment Maker          | Create dataflows  | Required to create any dataflow. Standard dataflows require additional roles depending on Dataverse tables permissions   |
| Basic User   | Write to non-custom tables | Has all the rights to work with non-custom tables          |
| System Customizer          | Create custom tables         | Custom tables this user creates will be visible to this user only |
| Members of the environment | Get data from dataflows        | Every member in the environment can get data from the dataflows in that environment |

## Row-level security isn't supported

The current version of standard dataflows doesn't support row-level security.

If you haven't heard of row-level security before, here's a quick introduction. If you have users with different levels of access to the same table, you can filter the data at the row level. For example, in the Orders table, you might have a SalesTerritory column, and you might want to filter the data in a way that users from California could only see records from the Orders table that belongs to California. This is possible through row-level security.

## Steps to assign roles

The steps in the following procedure are sourced from [Configure user security to resources in an environment](/power-platform/admin/database-security).

Verify that the user you want to assign a security role to is present in the environment. If not, add the user to the environment. You can assign a security role as part of the process of adding the user. More information: [Add users to an environment](/power-platform/admin/add-users-to-environment)

In general, a security role can only be assigned to users who are in the Enabled state. But if you need to assign a security role to users in the Disabled state, you can do so by enabling **allowRoleAssignmentOnDisabledUsers** in OrgDBOrgSettings.

To add a security role to a user who is already present in an environment:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Users**.

3. Select **Manage users in Dynamics 365**.

   > [!div class="mx-imgBorder"]
   > ![Select Manage users in Dynamics 365.](/power-platform/admin/media/manage-users-dynamics-365.png)

4. Select the user from the list of users in the environment, and then select **Manage roles**.

   > [!div class="mx-imgBorder"]
   > ![Select Manage roles.](/power-platform/admin/media/select-manage-roles.png)

5. Assign one or more security roles to the user.

   > [!div class="mx-imgBorder"]
   > ![Manage user roles.](/power-platform/admin/media/manage-user-roles.png)

6. Select **OK**.
