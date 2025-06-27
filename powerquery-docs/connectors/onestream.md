---
title: Power Query OneStream connector
description: Provides support, prerequisites, and instructions on how to connect to your OneStream data.
author: os-mik
ms.author: dougklo
ms.date: 05/29/2024
ms.topic: conceptual
ms.subservice: connectors
---

# OneStream

> [!NOTE]
> The following connector article is provided by OneStream Software, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the OneStream Software website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)</br>Power BI (Dataflows)</br>Fabric (Dataflow Gen2)|
| Authentication Types Supported | Organizational Account |

## Prerequisites

OneStream platform version 8.2 or higher is required.
There are [system requirements](https://www.microsoft.com/download/details.aspx?id=58494) to verify before you install Microsoft Power BI Desktop.

## Capabilities supported

The OneStream Connector enables secure access to your OneStream applications. With the connector you can:

* Access cube and relational data from OneStream applications, directly into Power BI.
* Access metadata members and all their OneStream properties.
* Easily recreate your full hierarchy structures in Power BI.
* Automate data loads to Power BI service.

## Connect to OneStream from Power BI Desktop

### Get Data

1. Open Power BI Desktop and select **Get data from other sources**.

   :::image type="content" source="./media/onestream/pbi-get-data.png" alt-text="Screenshot of the get data experience.":::

2. Type **OneStream** in the search box to find the custom OneStream connector.

   :::image type="content" source="./media/onestream/os-connector-search.png" alt-text="Screenshot of the get data dialog with OneStream entered in the search box.":::

3. Select **OneStream**.

4. Select **Connect**.

### Configure the connector

1. Enter your OneStream environment URL. Ensure that the Environment URL is entered with a leading **https://** (as shown in the following screenshot). Otherwise, connection attempts don't work properly.

   :::image type="content" source="./media/onestream/os-connector-config.png" alt-text="Screenshot of the connector configuration dialog with the environmental URL entered.":::

2. Select **OK**.

### Authenticate

1. Select **Sign In** to start the authentication process.

2. This selection redirects and opens OneStream Identity Server on your default browser for login.

3. Log in to your OneStream Account.

   :::image type="content" source="./media/onestream/os-connector-login.png" alt-text="Screenshot of the authentication dialog with the OneStream login dialog displayed.":::

4. After successful login, select **Connect**.

   :::image type="content" source="./media/onestream/os-connector-connect.png" alt-text="Screenshot of the authentication dialog with the user signed in.":::

### OneStream navigator

After successful login, the OneStream connector shows the navigator with 4 types of calls available:

* [Get Cube](#get-cube)
* [Get Custom Adapter](#get-custom-adapter)
* [Get Dimension](#get-dimension-and-get-member-properties)
* [Get Member Properties](#get-dimension-and-get-member-properties)

:::image type="content" source="./media/onestream/os-connector-get-dimension.png" alt-text="Screenshot of the navigator dialog with Get Dimension selected." lightbox="./media/onestream/os-connector-get-dimension.png":::

Refer to the [best practices](#best-practices-and-functions-help) if you need help configuring the functions.

After selecting the function you want to use, follow through to [load the data](#load-data).

### Load data

1. Based on the requirements, provide the values for the given function. You can toggle the parameters to just the required ones or use all of them if necessary. Power BI displays a preview of data for the table that would be returned.

2. After providing the parameters, either load or transform the data.

   * Select **Load** to load the table into the internal Power BI Desktop data model.
   * Select **Transform data** to make changes in the table before loading it into the internal Power BI Desktop data model.
     **Transform data** launchs the Power Query editor in a new window with a representative view of the table.

3. If you need to load additional tables, repeat the previous steps of picking the function, providing the values, and loading or transforming the table.

4. After you load the to the Power BI Desktop data model, you're able to create relationships between tables as well as create reports.

### Details on OneStream custom connector

The OneStream connector fetches data from a OneStream instance using Representational State Transfer (REST) APIs.

The OneStream connector performs all APIs calls under the permission boundary of current logged-in user, therefore applying the security defined for the user in OneStream.

> [!NOTE]
> The connector only uses READ scopes on behalf of the Power BI report user to perform all operations. The OneStream connector can't perform any update operation.

The OneStream connector has a limitation of 2 million rows per call. Executing a query over this limit triggers an error.

### Publish Power BI Reports to Power BI Service

1. Select the **Publish** button in Power BI Desktop to publish data, reports, and data model to the cloud-based Power BI service.

2. Choose the appropriate Power BI workspace and select **Select**.

   :::image type="content" source="./media/onestream/pbi-publish.png" alt-text="Screenshot of Power BI Desktop with the publish button, the workspace, and the publish select button emphasized." lightbox="./media/onestream/pbi-publish.png":::

3. After a successful publication, a "Success" message with a link to navigate to the Power BI Service is displayed.

   :::image type="content" source="./media/onestream/pbi-publish-success.png" alt-text="Screenshot of the publishing to Power BI dialog, with the success message and an emphasized link.":::

4. Select the link to view all reports from Power BI Desktop in the Power BI service, as well as create dashboards in the Power BI service.

   :::image type="content" source="./media/onestream/pbi-publish-access.png" alt-text="Screenshot of the refresh data model on the service with the refresh icon emphasized." lightbox="./media/onestream/pbi-publish-access.png":::

## Best practices and functions help

### General best practices

* Load only the necessary grain of data. Meaning, if you only need aggregated data at the month level, don't load data at the daily level. The smaller the model, the more performant it always is.

* Limit the number of transformations you make. The more you complicate the query, the more chance there is for the query to fail.

* Leverage OneStream's financial logic and Cube Views/Data Adapters to create the tables that are then loaded into Power BI.

  Example: Consolidations involve the parent entity only taking 40% of one of the child entities' values. Ensure that this logic is done in OneStream, and you load the data adapter in Power BI, which already has the values populated.

  Attempting to replicate the logic in Power BI would be extremely inefficient and is better performed in the source system.

### Loading large dataset using loop on custom M queries

When loading large amount of data that could potentially fail due to the maximum row limit, it is recommended to create a custom query directly in PowerBI to loop through a dimension, splitting the query into multiple queries and joining the data from the query results in PowerBI directly.
  
See the example below for a query that executes a CubeViewMD Data Adapter retrieval multiple times. The 3 main components are:

* GetCubeViewColumns which returns a list of all the columns from the specified adapter you are trying to load. The columns are set manually to avoid having to dynamically parse them which is expensive (requires one additional query execution).

* GetEntities which executes a DataAdapter configured as Method - Members (see image below) to retrieve all members needed for a dimension (in this case entity). You can change this to loop over any dimension / member script needed.

:::image type="content" source="./media/onestream/os-method-adapter-loop.png" alt-text="Screenshot of the setup of a Members data adapter configuration." lightbox="./media/onestream/os-connector-get-adapter.png":::

* GetCubeViewData which runs a CubeViewMD adapter. The CubeView contains a parameter called pbi_param_entity, which is the one used for passing the values of GetEntities when looping.

You can use this code in a custom query to execute the chosen data adapter in loop over the specified member script for a dimension.

```
let
   GetCubeViewColumns = () as list =>
      let 
            Source = {"Cube","Entity","Parent","Cons","Scenario","Time","StartDate","EndDate","View","Account","Flow","Origin","IC","UD1","UD2","UD3","UD4","UD5","UD6","UD7","UD8","CalcScript","Amount"}
      in
            Source,

   GetEmptyTable = () as table =>
      let
            Source = #table(
               GetCubeViewColumns(),
               {
               }
            )
      in 
            Source,

   GetEntities = () as table =>
      let
            Source = OneStream.Navigation("https://your-environment.onestreamcloud.com"),
            YourApp = Source{[Key="YourApp"]}[Data],
            YourCube = YourApp{[Key="YourCube"]}[Data],
            #"Get Custom Adapter" = YourCube{[Key="Get Custom Adapter"]}[Data],
            MemberList = #"Get Custom Adapter"("zzz_PBI_EntityMembers", "Default", null, null),
            MemberListNoDuplicates = Table.Distinct(#"Invoked FunctionGet Custom Adapter1", {"MemberId"}),
            MemberListNamesOnly = Table.RemoveColumns(MemberListNoDuplicates,{"DimTypeId", "DimId", "MemberId", "Description", "SupportsChildren", "IndentLevel"})
      in
            MemberListNamesOnly,


   GetCubeViewData = (EntityName) as table =>
      let
            Source = OneStream.Navigation("https://your-environment.onestreamcloud.com"),
            YourApp = Source{[Key="YourApp"]}[Data],
            YourCube = YourApp{[Key="YourCube"]}[Data],
            #"Get Custom Adapter" = YourCube{[Key="Get Custom Adapter"]}[Data],
            CubeView = try #"Get Custom Adapter"("zzz_PBI_CubeViewAdapter", "Default", null, "pbi_param_entity="& EntityName),
            CubeViewOrDefault = if CubeView[HasError] then GetEmptyTable() else CubeView[Value]
      in
            CubeViewOrDefault,

   List = GetCubeViewColumns(),
   Source = GetEntities(),
   Data = Table.AddColumn(Source, "LoopCubeViewData", each GetCubeViewData([Name])),
   Expand = Table.ExpandTableColumn(Data, "LoopCubeViewData", List),
   Rows = Table.SelectRows(Expand, each [Cube] <> null)
in
   Rows
```

### Get cube

This function retrieves data from a OneStream Cube.

* All the parameters can be specified via OneStream Member Script (for example, 2023.Base for time), except View and Currency which require a single member.
* Currency refers to the Consolidation dimension in OneStream, so you can use Local or Aggregate for example.

:::image type="content" source="./media/onestream/os-connector-get-cube.png" alt-text="Screenshot of the navigator dialog with a Get Cube Data function emphasized." lightbox="./media/onestream/os-connector-get-cube.png":::

### Get custom adapter

* Specify the Workspace and Adapter Name (mandatory parameters).
* Table Name and Parameters are optional.
* Refer to a configured dashboard adapter inside OneStream to make sure you are inserting the right values.

:::image type="content" source="./media/onestream/os-connector-get-adapter.png" alt-text="Screenshot of the navigator dialog with a Get Custom Adapter Data function emphasized." lightbox="./media/onestream/os-connector-get-adapter.png":::

### Get dimension and get member properties

* Specify the OneStream Dimension Type you want to retrieve.
* Specify the Scenario Type. Use Default or All to use the selected cube default dimensions and retrieve the default properties.
* Include Descriptions can be set to True or False.

:::image type="content" source="./media/onestream/os-connector-get-dimension.png" alt-text="Screenshot of the navigator dialog with a Get Dimension function emphasized." lightbox="./media/onestream/os-connector-get-dimension.png":::
