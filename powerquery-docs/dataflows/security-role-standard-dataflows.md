---
title: Security roles and permission levels in standard dataflows
description: Describes the security roles and permission levels used in standard dataflows.
author: Luitwieler
ms.topic: conceptual
ms.date: 6/14/2023
ms.author: jeluitwi
---

# Security roles and permission levels required to create standard dataflows

Dataflows are created within an environment, and standard dataflows load data to new, existing, or standard Dataverse tables that also reside in the environment. Depending on the scenario, a dataflow creator might need different or multiple roles to create and refresh a dataflow successfully. This article walks you through the roles and permission levels related to standard dataflows, and provides links to articles to learn how to manage them.

## Roles required to create standard dataflows

Some roles are needed to create dataflows, and others are required to control which tables a dataflow creator can create or update. The following table describes each role, along with the level of permission associated with that role.

| Security role              | Privileges                     | Description                                                  |
| -------------------------- | ------------------------------ | ------------------------------------------------------------ |
| Environment Maker          | Create dataflows  | Required to create any dataflow. Standard dataflows require additional roles depending on Dataverse tables permissions.   |
| Basic User   | Write to non-custom tables | Has all the rights to work with non-custom tables.         |
| System Customizer          | Create custom tables         | Custom tables this user creates are visible to this user only. |

## Steps to assign roles

The steps in the following procedure are sourced from [Configure user security to resources in an environment](/power-platform/admin/database-security).

Verify that the user you want to assign a security role to is present in the environment. If not, add the user to the environment. You can assign a security role as part of the process of adding the user. More information: [Add users to an environment](/power-platform/admin/add-users-to-environment)

In general, a security role can only be assigned to users who are in the Enabled state. But if you need to assign a security role to users in the Disabled state, you can do so by enabling **allowRoleAssignmentOnDisabledUsers** in OrgDBOrgSettings.

To add a security role to a user who is already present in an environment:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Users**.

3. Select **Manage users in Dynamics 365**.

   ![Select Manage users in Dynamics 365.](/power-platform/admin/media/manage-users-dynamics-365.png)

4. Select the user from the list of users in the environment, and then select **Manage roles**.

   :::image type="content" source="/power-platform/admin/media/select-manage-roles.png" alt-text="Select Manage roles.":::

5. Assign one or more security roles to the user.

   :::image type="content" source="/power-platform/admin/media/manage-user-roles.png" alt-text="Manage user roles.":::

6. Select **OK**.

## Row-level security isn't supported

The current version of standard dataflows doesn't support row-level security.

If you haven't heard of row-level security before, here's a quick introduction. If you have users with different levels of access to the same table, you can filter the data at the row level. For example, in the Orders table, you might have a SalesTerritory column. Also, you might want to filter the data in a way that users from California could only see records from the Orders table that belongs to California. This difference is possible through row-level security.

## Sharing or coauthoring dataflows

Currently, it's not possible for two different users to collaborate on the same dataflow. Only the creator (owner) of the dataflow can edit it. In the event a dataflow needs to be transferred to a different user, an environment administrator can change the owner of the dataflow from one user to another, as long as the current owner is still a member of the organization. For security reasons, transferring ownership removes the connection associated with the dataflow and requires the new owner to update the credentials used by the dataflow.

