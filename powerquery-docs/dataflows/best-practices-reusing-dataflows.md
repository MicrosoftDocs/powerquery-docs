---
title: Best practices around reusing dataflows across environments and workspaces
description: Best practices around reusing dataflows across environments and workspaces
author: radacad

ms.service: powerquery
ms.reviewer: v-douklo
ms.topic: conceptual
ms.date: 05/25/2020
ms.author: v-rerad
---

# Best practices around reusing dataflows across environments and workspaces

This article provides the best practices for reusing dataflows.

## Separate data transformation (T), and staging (or extraction E) dataflows

If dataflows are designed to do all actions in one dataflow, then it is hard to reuse them. The best dataflows to reuse are those dataflows doing only a few actions. Separating dataflows to do only one specific action is one of the best ways of reusing them. If you have a set of dataflows as staging dataflows, their only action is to extract data "as is" from the source system. These dataflows can be reused in multiple other dataflows.

If you have data transformation dataflows, you can split them into dataflows that are doing common transformations. Each dataflow can perform a few actions. This ensures that the output of that dataflow is reusable by other dataflows.

![multi-layered dataflow architecture](media/MultiLayeredDF.png)

## Use multiple workspaces

Each workspace (or environment) is available only for members of that workspace. If you build all your dataflows in one workspace, you're minimizing the reuse of your dataflows. You can have some generic workspaces for dataflows that are processing tenant-wide entities. You can also have some workspace for dataflows to process entities across multiple departments. And you can also have some workspaces for dataflows to be used only in specific departments.

![separate workspaces](media/separateworkspaces.png)

### Set the correct access levels on workspaces

To give access to dataflows in other workspaces to use the output of the dataflow in a workspace, you just need to give them the View access in the workspace. To learn more about other roles in a Power BI workspace, see [Roles in the new workspaces](https://docs.microsoft.com/power-bi/collaborate-share/service-new-workspaces#roles-in-the-new-workspaces).

![access to the workspace](https://docs.microsoft.com/power-bi/collaborate-share/media/service-create-the-new-workspaces/power-bi-workspace-add-members.png)

## Endorsement on the dataflow

There can be many dataflows created under the tenant. It would be hard for the users of the dataflow to know which dataflow is more reliable to use. That's why there's a system of endorsement. Authors of a dataflow, or those who have edit access to it, can endorse the dataflow at three levels: no endorsement, promoted, and certified. 

The levels of endorsement are helpful for users to find reliable dataflows easier and faster. The dataflow with a higher endorsement level comes up first. The tenant admin can choose who are authorized to endorse dataflows to the certified level. To learn more about endorsement on dataflows, see [Promote or certify dataflows (preview)](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-promote-certify).

![endorsement on the dataflow](https://docs.microsoft.com/power-bi/transform-model/media/service-dataflows-promote-certify/powerbi-dataflow-endorsement-power-query.png)


