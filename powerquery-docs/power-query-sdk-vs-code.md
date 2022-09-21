---
title: Using the Power Query SDK 
description: A guided tour on how to use the Power Query SDK in Visual Studio and the core functionality provided through it
author: ptyx507x

ms.topic: quickstart
ms.date: 9/20/2022
ms.author: miescobar
---

# Using the Power Query SDK

This article focuses on the experience available for the Power Query SDK found in Visual Studio Code. You can learn more on how to install the Power Query SDK for Visual Studio from the article on [Installing the SDK](/powerquery-docs/InstallingSDK.md).

## Create a new project

>[!TIP]
>Before creating an extension project, it is recommended that you create a new folder where you'll store your extension project. During the creation of a new project, if no folder is selected, the Power Query SDK will help you locate or create a new folder before creating your extension project.

Once in Visual Studio Code, In the main *Explorer* pane of Visual Studio Code, you'll be able to see a section with the name **Power Query SDK**. This section will have only one button that reads *Create an extension project*. Select this button.

![Create a new extension project button in Visual Studio Code](media/power-query-sdk-vs-code/create-new-extension.jpg)

This button will open an input field at the top of the Visual Studio Code interface where you can enter the name of your new extension project and hit Enter.

![Creating a new extension project and naming the project](media/power-query-sdk-vs-code/new-project-name.jpg)

After a few seconds, your Visual Studio Code window should open the main *.pq file for your extension project that contains your connector logic. The Power Query SDK will automatically run some necessary tasks to complete the setup of your workspace and you can check this in the Output console in Visual Studio Code.

![Extension project created using the Hello World template](media/power-query-sdk-vs-code/extension-project-created.jpg)

The Power Query SDK automatically creates the following set of files:

* A **settings.json** file that dictates specific settings to work with at your workspace level
* It builds the extension as a **.mez** file and stores it in a new *bin\AnyCPU\Debug* folder
* A set of connector icons as png files
* A **resources.resx** that serves as the main storage for strings to be used in the extension
* A .pq file that holds the main logic of your extension or connector
* A .query.pq file that main purpose is to be used as a way to create test queries that you can later evaluate
* A .proj file that holds information about the extension project

![Connector files](media/power-query-sdk-vs-code/connector-files.jpg)

Once a extension project is recognized by the Power Query SDK, the section for the Power Query SDK will change its appearance, and will now display a list of tasks that you can run against your new extension project.

![Tasks inside the Power Query SDK section](media/power-query-sdk-vs-code/ui-driven-tasks.jpg)


## Credentials

>[!IMPORTANT] 
>Before you can evaluate any queries of your data connector, it is required to have a credential set.

The Power Query SDK offers multiple tasks through its user interface to allow you to set, list and delete credentials from your extension project.

### Set credential

The Power Query SDK is primarily driven by tasks that can be triggered via multiple entry points. Setting a credential can be done in two ways and this is true for most tasks.

1. Through the entry in the Power Query SDK section in the Explorer pane

![Setting a credential through the Power Query SDK section in the Explorer](media/power-query-sdk-vs-code/set-credential.jpg)
 
2. Through the Terminal by selecting the "Run Task..." option and selecting the group of tasks for powerquery

![Setting a credential through the Terminal menu](media/power-query-sdk-vs-code/set-credential-terminal-task.jpg)


When you run this task, Visual Studio Code will guide you through a series of prompts to allow you to set the credential. These series of prompts are predictable and will always consist of the same stages:

1. Choose the data source kind
2. Choose the connector file
3. Choose the authentication method

 For the existing extension project, the [authentication method](HandlingAuthentication.md) available is anonymous and once the authentication is set a message box confirming that a credential has been generated successfully should be shown at the bottom right corner of the window.

![Credential has been generated successfully](media/power-query-sdk-vs-code/credential-set.jpg)

### List credentials

Similar to setting a credential, the task to list credentials has two entry points in the same places: Power Query SDK section in the Explorer pane and inside the Terminal menu.

When this task is executed, it showcases the available credentials inside of the output terminal.

![Credentials listed inside the Output console](media/power-query-sdk-vs-code/list-credentials.jpg)

### Clear ALL credentials

Similar to the previous two tasks, the task to list credentials has two entry points in the same places: Power Query SDK section in the Explorer pane and inside the Terminal menu.

This task serves as a way to clear all credentials from your current session when you need to set a new credential to evaluate your queries.

The informational messages for this task are also shown in the output console.

![Informational message for the Clear ALL credentials task](media/power-query-sdk-vs-code/clear-all-credentials.jpg)

## Evaluate a query and the results panel

Before you can evaluate any tests queries, a credential must be set. Using the connector that was created in the previous section, you can open the `*.query.pq` file that serves as your test query file.

For this specific connector where the project name was MyConnector, the code looks as follows:

``
// Use this file to write queries to test your data connector
let
    result = MyConnector.Contents()
in
    result
``

Before evaluating the query, let's change the code to look as follows:

``
// Use this file to write queries to test your data connector
let
    result = MyConnector.Contents("Hello World")
in
    result
``

Make sure to save the file after changing its code.

To evaluate this query you have three options:

* Right select the file that's in use and select the option that reads "Evaluate current power query file"

![Right click the current file to evaluate it](media/power-query-sdk-vs-code/right-click-evaluate.jpg)

* Going through the Terminal menu and selecting the "Evaluate current file" task

![Selecting the evaluate current file task from the terminal menu experience](media/power-query-sdk-vs-code/terminal-evaluate.jpg)

* Use the native Run & Debug option from Visual Studio Code, select the hyperlink to create a launch.json file and then evaluate the file

![Create a launch.json file to evaluate queries through the Run and Debug extensibility](media/power-query-sdk-vs-code/create-launch-json.jpg)

After evaluating the query, the results will be displayed in the console at the bottom of the window and in a new panel called the **results panel** on the right.

![Visual Studio Code window after evaluation has finalized showing the output in the console and the results panel](media/power-query-sdk-vs-code/evaluation-complete.jpg)

The results panel consists of three tabs:

* **Output tab:** Displays a data preview of the query evaluated. If it's a table it will be displayed as grid.

![Output tab in the results panel](media/power-query-sdk-vs-code/results-output.jpg)

* **Summary:** Displays a summary of the Activity that ran the evaluation with statistics around it.

![Summary tab in the results panel](media/power-query-sdk-vs-code/summary-output.jpg)

* **DataSource:** Displays general information about the data source used for the evaluation.

![Summary tab in the results panel](media/power-query-sdk-vs-code/datasource-output.jpg)

To evaluate a different query you simply need to modify the *.query.pq file, save it and then run the evaluation task again with any of the three methods.

>[!NOTE]
> The Power Query SDK does not manage any sort of caching mechanism for the evaluations.

## Bring a legacy extension project to the new SDK

This section is created to help connector developers who have extension projects that were created with the legacy [Visual Studio based Power Query SDK](https://marketplace.visualstudio.com/items?itemName=Dakahn.PowerQuerySDK).

To follow along, we recommend downloading the connector projects available from our [DataConnectors repository for the TripPin sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/TripPin/9-TestConnection), specifically the sample 9-TestConnection.

To bring the legacy extension project to the new SDK, follow these steps:

1. Navigate to the folder where your extension project is located with Visual Studio Code's "Open folder" option in the File menu
2. Setup a workspace using the existing folder and its contents via one of the following two methods:

* The Power Query SDK has a mechanism to recognize the contents of your folder and suggest you to enable the conversion to a Power Query SDK workspace

![Popup in the Visual Studio Code interface that suggests the user an upgrade to the Power Query SDK workspace](media/power-query-sdk-vs-code/upgrade-suggestion.jpg)

* You can run the **Setup workspace** and the **Build Task** from the terminal menu. These will effectively create the **.mez** file and the **settings.json** files needed for the workspace

The addition of the two new folders and files is what transforms the current workspace into a new Power Query SDK workspace.

![Upgrading the extension project to the new Power Query SDK](media/power-query-sdk-vs-code/upgrade-sdk.jpg)

## Setup workspace

What the Setup workspace task does is effectively create a settings.json file for your workspace that dictates some variables that will be used for your workspace when it comes to evaluations and general settings.

## Build a extension file

The build task allows you to create the .mez file for your extension on demand.

## Run TestConnection function

TestConnection is a function that enables your connector to be refreshed in the Microsoft Cloud through services such as Power BI. It's a record implemented inside of your connector data source record. You can learn more about the implementation of the TestConnection handler from the [sample available for Test connection](https://learn.microsoft.com/power-query/samples/trippin/9-testconnection/readme).

The task to run the TestConnection enables you to test such handler inside the Power Query SDK without having to manually try this handler in the Microsoft Cloud.

To run this task, first set a credential for your connector and then run the task either from the Power Query SDK section in the Explorer or through the list of tasks inside the terminal menu.

The result of such task will be displayed in the output terminal at the bottom of the window.

![Result of the Run TestConnection function in the Power Query SDK](media/power-query-sdk-vs-code/TestConnection.jpg)

## Feedback and bugs

Do you have any feedback, suggestions or bugs that you'd like to report? Visit our [official public repository on GitHub](https://github.com/microsoft/vscode-powerquery-sdk).

You can use the [Power BI Community forum](https://community.powerbi.com/t5/Power-Query/bd-p/power-bi-services) to post general questions around Power Query, the M language and custom connector development.