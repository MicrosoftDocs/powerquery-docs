---
title: Power Query SDK Overview
description: A guided tour on how to use the Power Query SDK in Visual Studio Code and the core functionality provided through it
author: ptyx507x

ms.topic: quickstart
ms.date: 5/15/2024
ms.author: miescobar
---
# Power Query SDK Overview

The purpose of this article is to give you an overview of the overall capabilities and development experience found inside of the Power Query SDK for Visual Studio Code.

## Create a new project

>[!TIP]
>Before creating an extension project, we recommend that you create a new folder where you'll store your extension project. During the creation of a new project, if no folder is selected, the Power Query SDK will help you locate or create a new folder before creating your extension project.

Once in Visual Studio Code, in the main **Explorer** pane of Visual Studio Code there's a section with the name **Power Query SDK**. This section has only one button that reads **Create an extension project**. Select this button.

:::image type="content" source="media/power-query-sdk-vs-code/create-new-extension.jpg" alt-text="Create a new extension project button in Visual Studio Code.":::

This button opens an input field at the top of the Visual Studio Code interface. Enter the name of your new extension project, and then select **Enter**.

:::image type="content" source="media/power-query-sdk-vs-code/new-project-name.jpg" alt-text="Creating a new extension project and naming the project.":::

After a few seconds, your Visual Studio Code window opens the main *.pq file for your extension project that contains your connector logic. The Power Query SDK automatically runs some necessary tasks to complete the set up of your workspace. You can check these tasks in the output console in Visual Studio Code.

:::image type="content" source="media/power-query-sdk-vs-code/extension-project-created.jpg" alt-text="Extension project created using the Hello World template.":::

The Power Query SDK automatically creates the following set of files:

* A **settings.json** file that dictates specific settings to work with at your workspace level.
* It builds the extension as a **.mez** file and stores it in a new bin\AnyCPU\Debug folder.
* A set of connector icons as .png files.
* A **resources.resx** file that serves as the main storage for strings that are used in the extension.
* A .pq file that holds the main logic of your extension or connector.
* A .query.pq file whose main purpose is to be used as a way to create test queries that you can later evaluate.
* A .proj file that holds information about the extension project.

:::image type="content" source="media/power-query-sdk-vs-code/connector-files.jpg" alt-text="List of connector files.":::

Once an extension project is recognized by Visual Studio Code, the section for the Power Query SDK changes its appearance, and now displays a list of tasks you can run against your new extension project.

:::image type="content" source="media/power-query-sdk-vs-code/ui-driven-tasks.jpg" alt-text="Tasks inside the Power Query SDK section.":::

## Credentials

>[!IMPORTANT]
>Before you can evaluate any of your data connector's queries, a set of credentials must first be created for the extension project.

The Power Query SDK offers multiple tasks through its user interface to allow you to set, list, and delete credentials from your extension project.

### Set credential

The Power Query SDK is primarily driven by tasks that can be triggered through multiple entry points. Setting a credential can be done in two ways (the other credential tasks can be done in the same way).

* Through the entry in the **Power Query SDK** section in the explorer pane.

   :::image type="content" source="media/power-query-sdk-vs-code/set-credential.jpg" alt-text="Setting a credential through the Power Query SDK section in the Explorer.":::

* Through the **Terminal** by selecting the **Run Task** option and then selecting the **Set credential** task.

   :::image type="content" source="media/power-query-sdk-vs-code/set-credential-terminal-task.jpg" alt-text="Setting a credential through the Terminal menu.":::

When you run this task, Visual Studio Code will guide you through a series of prompts to allow you to set the credential. These series of prompts are predictable and always consist of the same stages:

1. Choose the data source kind.
2. Choose the connector file.
3. Choose the authentication method.

For the existing extension project, the [authentication method](HandlingAuthentication.md) available is anonymous. Once the authentication is set, a message that confirms a credential has been generated successfully is displayed at the bottom right corner of the window.

:::image type="content" source="media/power-query-sdk-vs-code/credential-set.jpg" alt-text="Credential has been generated successfully.":::

### List credentials

Similar to setting a credential, the task to list credentials has two entry points in the same places: the **Power Query SDK** section in the **Explorer** pane and inside the **Terminal** menu.

When this task is executed, it showcases the available credentials inside the output terminal.

:::image type="content" source="media/power-query-sdk-vs-code/list-credentials.jpg" alt-text="Credentials listed inside the Output console.":::

### Clear ALL credentials

Similar to the previous two tasks, the task to clear all credentials has two entry points in the same places: the **Power Query SDK** section in the **Explorer** pane and inside the **Terminal** menu.

This task serves as a way to clear all credentials from your current session when you need to set a new credential to evaluate your queries.

The informational messages for this task are also shown in the output console.

:::image type="content" source="media/power-query-sdk-vs-code/clear-all-credentials.jpg" alt-text="Informational message for the Clear ALL credentials task.":::

## Evaluate a query and the results panel

Before you can evaluate any test queries, a credential must be set. Using the connector that was created in the previous section, you can open the `*.query.pq` file that serves as your test query file.

For this specific connector where the project name was MyConnector, the code looks as follows:

```powerquery-m
// Use this file to write queries to test your data connector
let
    result = MyConnector.Contents()
in
    result
```

Before evaluating the query, let's change the code as follows:

```powerquery-m
// Use this file to write queries to test your data connector
let
    result = MyConnector.Contents("Hello World")
in
    result
```

Make sure to save the file after changing its code.

To evaluate this query, you have three options:

* Right select the file that's in use and select the **Evaluate current power query file** option.

:::image type="content" source="media/power-query-sdk-vs-code/right-click-evaluate.jpg" alt-text="Right click the current file to evaluate it.":::

* Go through the **Terminal** menu and select the **Evaluate current file** task.

:::image type="content" source="media/power-query-sdk-vs-code/terminal-evaluate.jpg" alt-text="Selecting the evaluate current file task from the terminal menu experience.":::

* Use the native **Run and Debug** option from Visual Studio Code, select the hyperlink to create a launch.json file, and then evaluate the file.

:::image type="content" source="media/power-query-sdk-vs-code/create-launch-json.jpg" alt-text="Create a launch.json file to evaluate queries through the Run and Debug extensibility.":::

After evaluating the query, the results are displayed in the console at the bottom of the window and in a new panel called the **result** panel on the right.

:::image type="content" source="media/power-query-sdk-vs-code/evaluation-complete.jpg" alt-text="Visual Studio Code window after evaluation has finalized showing the output in the console and the result panel.":::

The result panel contains three tabs:

* **Output tab:** Displays a data preview of the query evaluated. If the data is a table, it's displayed as grid.

   :::image type="content" source="media/power-query-sdk-vs-code/results-output.jpg" alt-text="Output tab in the results panel.":::

* **Summary:** Displays a summary of the activity that ran the evaluations, along with the statistics associated with that activity.

   :::image type="content" source="media/power-query-sdk-vs-code/summary-output.jpg" alt-text="Summary tab in the results panel.":::

* **DataSource:** Displays general information about the data source used for the evaluation.

   :::image type="content" source="media/power-query-sdk-vs-code/datasource-output.jpg" alt-text="DataSource tab in the results panel.":::

To evaluate a different query, you just modify the *.query.pq file, save it, and then run the evaluation task again with any of the three methods.

>[!NOTE]
> The Power Query SDK doesn't manage any kind of caching mechanism for the evaluations.

## Bring a legacy extension project to the new SDK

This section helps connector developers who have extension projects that were created with the legacy [Visual Studio based Power Query SDK](https://marketplace.visualstudio.com/items?itemName=Dakahn.PowerQuerySDK).

To follow along, we recommend downloading the connector projects available from our [DataConnectors repository for the TripPin sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/9-TestConnection), specifically the sample 9-TestConnection.

To bring the legacy extension project to the new SDK, follow these steps:

1. In Visual Studio Code, select **File** > **Open folder**, then navigate to the folder where your extension project is located.
2. Set up a workspace using the existing folder and its contents using one of the following two methods:

   * The Power Query SDK has a mechanism to recognize the contents of your folder and suggests that you enable the conversion to a new Power Query SDK workspace.

      :::image type="content" source="media/power-query-sdk-vs-code/upgrade-suggestion.jpg" alt-text="Popup in the Visual Studio Code interface that suggests the user an upgrade to the Power Query SDK workspace.":::

   * Run the **Setup workspace** and the **Build Task** from the terminal menu. These will effectively create the **.mez** file and the **settings.json** files needed for the workspace.

The addition of two new folders and files is what transforms the current workspace into a new Power Query SDK workspace.

:::image type="content" source="media/power-query-sdk-vs-code/upgrade-sdk.jpg" alt-text="Upgrading the extension project to the new Power Query SDK.":::

### Set up workspace

What the Set up workspace task does is effectively create a settings.json file for your workspace that dictates some variables that will be used for your workspace when it comes to evaluations and general settings.

### Build an extension file

The build task allows you to create the .mez file for your extension on demand.

## Run TestConnection function

TestConnection is a function that enables your connector to be refreshed in the Microsoft Cloud through services such as Power BI. It's a record implemented inside of your connector data source record. You can learn more about the implementation of the TestConnection handler from the [sample available for Test connection](samples/trippin/9-testconnection/readme.md).

The task to run TestConnection enables you to test the handler inside the Power Query SDK without having to manually try this handler in the Microsoft Cloud.

To run this task, first set a credential for your connector and then run the task either from the **Power Query SDK** section in the **Explorer** or through the list of tasks inside the terminal menu.

The result of this task is displayed in the output terminal at the bottom of the window.

:::image type="content" source="media/power-query-sdk-vs-code/testconnection.jpg" alt-text="Result of the Run TestConnection function in the Power Query SDK.":::

## Feedback and bugs

Do you have any feedback, suggestions, or bugs that you'd like to report? Visit our [official public repository on GitHub](https://github.com/microsoft/vscode-powerquery-sdk).

You can use the [Power BI Community forum](https://community.powerbi.com/t5/Power-Query/bd-p/power-bi-services) to post general questions around Power Query, the M language, and custom connector development.
