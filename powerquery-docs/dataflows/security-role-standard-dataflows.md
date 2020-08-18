# Security roles and permission levels in standard dataflows

If someone in the team has created a dataflow and want to share it with other team members, how does it work? what are the roles and permission level options available? This article, take you through the roles and permission levels related to the standard dataflows.

## Access to the environment

The standard dataflow stores the data into Common Data Service. The common data service is located in an environment. Users should have access to the environment first to be able to get other steps of accessing the data stored in common data services, and also the dataflows.

![Add user to the environment](https://docs.microsoft.com/power-platform/admin/media/add-user.png)

## Roles

There are multiple roles to configure the security level for the standard dataflows. Each role is mentioned below with the level of permission for it;

| Security role              | privileges                     | Description                                                  |
| -------------------------- | ------------------------------ | ------------------------------------------------------------ |
| Environment Maker          | create dataflows and entities  | can create dataflows and write into custom or non-custom entities |
| Common Data Service User   | Write into non-custom entities | has all the rights to work with non-custom entities          |
| System Customizer          | Create custom entities         | custom entities that this user create will be only visible to this user only |
| Members of the environment | Get data from dataflows        | every member in the environment can get data from the dataflows in that environment |

## Row-level security is not supported

The current version of standard dataflows doesn't support the row-level security.

If you haven't heard of Row-level security before, here is a quick introduction about it. If you have users with different levels of access to the same table, you can filter the data at the row level. For example, in the Orders table, you might have a SalesTerritory column, and you might want to filter the data in a way that users from California, only could see records from the Orders table that belongs to California. This is possible through row-level security.

## Steps to assign roles

Steps below are sourced from [this article](https://docs.microsoft.com/power-platform/admin/database-security). 

Verify that the user you want to assign a security role to is present in the environment. If not, add the user to the environment. You'll be able to assign a security role as part of the process of adding the user. More information: [Add users to an environment](https://docs.microsoft.com/power-platform/admin/add-users-to-environment)

In general, a security role can only be assigned to users who are in the Enabled state. But if you need to assign a security role to users in the Disabled state, you can do so by enabling **allowRoleAssignmentOnDisabledUsers** in OrgDBOrgSettings.

To add a security role to a user who is already present in an environment:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Users**.

3. Select **Manage users in Dynamics 365**.

   ![Select Manage users in Dynamics 365](https://docs.microsoft.com/power-platform/admin/media/manage-users-dynamics-365.png)

4. Select the user from the list of users in the environment, and then select **Manage roles**.

   ![Select Manage roles](https://docs.microsoft.com/power-platform/admin/media/select-manage-roles.png)

5. Assign one or more security roles to the user.

   ![Manage user roles](https://docs.microsoft.com/power-platform/admin/media/manage-user-roles.png)

6. Select **OK**.