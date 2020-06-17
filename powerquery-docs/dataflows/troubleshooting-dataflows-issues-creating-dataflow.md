# Troubleshooting dataflows issues: Creating Dataflows

You might get an issue when you want to create a dataflow, this article reveals some of the most common errors and issues, and how to fix them;

## Problem: Cannot Create a dataflow in My Workspace

This problem happens, when you want to create a dataflow in "My Workspace" in Power BI, and you cannot.

![My Workspace](media/MyWorkspace.png)

Reason:
"My Workspace" has no dataflow capability.

Resolution:

Create your dataflows in [organizational workspaces](https://docs.microsoft.com/power-bi/collaborate-share/service-create-the-new-workspaces). It is not possible to have dataflows in "My Workspace". [This link](https://docs.microsoft.com/power-bi/collaborate-share/service-create-the-new-workspaces) guides you to create an organizational workspace.

## Problem: Cannot Create a dataflow in an Organizational Workspace with read-only rights

If you are in an organization workspace, however, you cannot still create a dataflow, it might be because of your access rights on that workspace.

Reason:

You do not have EDIT rights on the workspace.

Resolution:

Ask the workspace Administrators or Members to give you the "Administrator", "Member", or "Contributor" [roles](https://docs.microsoft.com/power-bi/collaborate-share/service-new-workspaces#roles-in-the-new-workspaces).

![Workspace Access Settings](media/WorkspaceAccess.png)

## Problem: Cannot Create a dataflow in a workspace with edit rights

This problem happens when you are not in "My workspace", you are in an organizational workspace that either you have created, or someone else has created and you are either "Administrator", "Member", or "Contributor" access. When you want to create a dataflow in this scenario, but you cannot even create the dataflow.

Reason: 

The access to dataflow creation is disabled by the Power BI tenant admin

Resolution:

Ask the Power BI tenant administrator to enable the access for you. The steps are as below;

1. Power BI tenant administrator should open the Power BI Admin Portal in the Power BI service.

   ![Power BI Admin Portal](media/PowerBIAdminPortal.png)

2. Under Tenant Settings, and under the Dataflow settings. Change to Enable and Apply.

   ![Enable Dataflow in Tenant Settings](media/EnableDataflow.png)

## Problem: Dataflow Creation Has Limited Options

When you can create a dataflow, however, you don't have all the options. For example, when you create a dataflow, you see the options below;

![Dataflow creation options limited](media/DataflowCreationLimited.png)

However, the full options are as below;

![Full Options for Dataflow Creation](media/DataflowCreationFull.png)

Reason:

You are creating a dataflow in an old version of Power BI workspace, called version one.

Resolution:

Upgrade your Power BI workspace to the new version (Version two). [This article](https://docs.microsoft.com/power-bi/collaborate-share/service-upgrade-workspaces) explains the details of upgrading your workspace.

![Upgrade classic workspace](media/UpgradeWorkspace.png)

