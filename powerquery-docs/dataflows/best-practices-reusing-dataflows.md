# Best practices around reusing dataflows across environments and workspaces

This article provides the best practices for reusing dataflows.

## Separate data transformation (T), and staging (or extraction E) dataflows

If dataflows are designed to do all actions in one dataflow, then it is hard to re-use them. The best dataflows to re-use are those which are doing only a few actions. Separating dataflows to do only one specific action is one of the best ways of re-using them. If you have a set of dataflows as staging dataflows. Their only action is to extract data "as is" from the source system. These dataflows can be re-used in multiple other dataflows.

If you have data transformation dataflows, you can split them into dataflows that are doing common transformations. each dataflow can perform a few actions. This ensures that the output of that dataflow is re-usable by other dataflows.

![multi-layered dataflow architecture](media/MultiLayeredDF.png)

## Use multiple workspaces

each workspace (or environment) is available only for members of that workspace. If you build all your dataflows in one workspace, you are minimizing the re-use of your dataflows. You can have some generic workspaces for dataflows that are processing tenant-wide entities. some workspace for dataflows to process entities across multiple departments. And some workspaces for dataflows to be used only in specific departments.

![separate workspaces](media/separateworkspaces.png)

### Set the correct access levels on workspaces

To give the access to dataflows in other workspaces to use the output of the dataflow in a workspace, you just need to give them the View access in the workspace. [This article](https://docs.microsoft.com/power-bi/collaborate-share/service-new-workspaces#roles-in-the-new-workspaces) explains about other roles in a Power BI workspace.

![access to the workspace](https://docs.microsoft.com/power-bi/collaborate-share/media/service-create-the-new-workspaces/power-bi-workspace-add-members.png)

## Endorsement on the dataflow

There can be many dataflows created under the tenant. It would be hard for the users of the dataflow to know which dataflow is more reliable to use. Therefore, there is a system of endorsement. Authors of dataflow, or those who have edit access to it, can endorse the dataflow in three levels: no endorsement, promoted, and certified. 

The levels are endorsement are helpful for users to find reliable dataflows easier and faster. the dataflow with higher endorsement level comes up first. The tenant admin can choose who are authorized to endorse dataflows to the certified level. Read [this article](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-promote-certify) to know more about the endorsement on the dataflows.

![endorsement on the dataflow](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-promote-certify/powerbi-dataflow-endorsement-power-query.png)

