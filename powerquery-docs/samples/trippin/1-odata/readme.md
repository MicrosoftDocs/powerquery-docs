---
title: TripPin 1 - OData
description: Writing an OData connector for the TripPin sample service
author: ptyx507x


ms.topic: tutorial
ms.date: 5/16/2024
ms.author: miescobar
---

# TripPin part 1 - Data connector for an OData service

This multi-part tutorial covers the creation of a new data source extension for Power Query. The tutorial is meant to be done sequentially&mdash;each lesson builds on the connector created in previous lessons, incrementally adding new capabilities to your connector.

In this lesson, you will:

> [!div class="checklist"]
> * Create a new Data Connector project using the Power Query SDK
> * Author a base function to pull data from a source
> * Test your connector in the Power Query SDk
> * Register your connector in Power BI Desktop

## Creating a basic OData connector

In this section, you create a new Data Connector project, provide some basic information, and test it in the Power Query SDK.

Open Visual Studio Code, we recommend that you create a new workspace and then create a new extension project. To create the new extension project, open the explorer and in the **Power Query SDK** section select the button that reads "Create an extension project".

![Create a Power Query SDK extension project](../../media/pq-sdk-create-extension-project.png)

After clicking this button,you'll be prompted to enter the name of the new project. Name this new project `TripPin`.

![New extension project created called TripPin using the Power Query SDK.](../../media/TripPin-project-created-pq-sdk.png)

Open the TripPin.pq file and paste in the following connector definition.

```powerquery-m
section TripPin;

[DataSource.Kind="TripPin", Publish="TripPin.Publish"]
shared TripPin.Feed = Value.ReplaceType(TripPinImpl, type function (url as Uri.Type) as any);

TripPinImpl = (url as text) =>
    let
        source = OData.Feed(url)
    in
        source;

// Data Source Kind description
TripPin = [
    Authentication = [
        Anonymous = []
    ],
    Label = "TripPin Part 1 - OData"
];

// Data Source UI publishing description
TripPin.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { "TripPin OData", "TripPin OData" }
];
```

 This connector definition contains:

* A Data Source definition record for the TripPin connector
* A declaration that Implicit (Anonymous) is the only authentication type for this source
* A function (`TripPinImpl`) with an implementation that calls [OData.Feed](/powerquery-m/odata-feed)
* A shared function (`TripPin.Feed`) that sets the parameter type to `Uri.Type`
* A Data Source publishing record that allows the connector to appear in the Power Query **Get Data** dialog 

Open the TripPin.query.pq file. Replace the current contents with a call to your exported function.

```powerquery-m
TripPin.Feed("https://services.odata.org/v4/TripPinService/")
```

Before you can test your connector, you have to build it. To do this, go to the Terminal and select the option that reads **Run Build Task...** (Keyboard shortcut ```Ctrl + Shift + B```). We recommend choosing the MakePQX option, but either option available to build should work.

![Running a build task before testing the connector.](../../media/pq-sdk-run-build-task.png)

The outcome of this operation creates a new folder called *bin* where your built connector will be stored as **TripPin.mez**.

![Running a build task before testing the connector.](../../media/pq-sdk-new-bin-folder.png)

The \<project>.query.pq file is used to test out your extension without having to deploy it to your Power BI Desktop's bin folder.  Using the tools available inside the Power Query SDK:
1. Select the option to **Set credential**
2. Select TripPin as the data source
3. Select the **TripPin.query.pq** file as the query/test file
4. Select *anonymous* as the authentication kind 

In the output dialog you see a message that confirms that you've set a credential for the data source and the details for such credential created.

![Output dialog displaying the details of the newly created authentication for the TripPin connectur using the url passed in the .query.pq file](../../media/pq-sdk-credential-set.png)

>[!NOTE]
>You can always clear the credentials using the **Clear ALL credentials** command or check the available credentials using the **List credentials** command within the Power Query SDK tools.

With the credential now in place, you can select the **TripPin.query.pq** file and either right select in the document to *Evaluate current power query file* or use the option to *Evaluate current file* from the Power Query SDK tools.

![Multiple alternatives to evaluate the current Power Query file](../../media/pq-sdk-evaluate-current-file.png)

The output dialog displays a message of the results from your evaluation as well as a new window with the name **PQTest result**.

![PQTest result window displaying the results of the evaluation executed](../../media/pq-sdk-test-result-window.png)

The **PQTest result** window consists of three tabs:
* **Output**: Displays a preview of your data in a grid.
* **Summary**: General evaluation details such as StartTime, EndTime, Duration, the file that was used for the evaluation and the status and more.
* **DataSource**: Provides information about the Data Source that was used from the Kind, the Function Name, and the path.


You can try out a few different OData URLs in the test file to see what how different results are returned. For example:

* `https://services.odata.org/v4/TripPinService/Me`
* `https://services.odata.org/v4/TripPinService/GetPersonWithMostFriends()`
* `https://services.odata.org/v4/TripPinService/People`

The TripPin.query.pq file can contain single statements, let statements, or full section documents.

```powerquery-m
let
    Source = TripPin.Feed("https://services.odata.org/v4/TripPinService/"),
    People = Source{[Name="People"]}[Data],
    SelectColumns = Table.SelectColumns(People, {"UserName", "FirstName", "LastName"})
in
    SelectColumns
```

>[!IMPORTANT]
>Make sure to always save your files as you work. If you make changes to your TripPin.pq file, you should always trigger a subsequent build task to make sure that you are testing against the latest version of your connector

Open [Fiddler](https://www.telerik.com/fiddler) to capture HTTP traffic, and run the query. You should see a few different requests to services.odata.org, generated by the mashup container process. You can see that accessing the root URL of the service results in a 302 status and a redirect to the longer version of the URL. Following redirects is another behavior you get “for free” from the base library functions.

One thing to note if you look at the URLs is that you can see the query folding that happened with the `SelectColumns` statement.
`https://services.odata.org/v4/TripPinService/People?$select=UserName%2CFirstName%2CLastName`

If you add more transformations to your query, you can see how they impact the generated URL.

This behavior is important to note. Even though you didn't implement explicit folding logic, your connector inherits these capabilities from the [OData.Feed](/powerquery-m/odata-feed) function. M statements are compose-able&mdash;filter contexts will flow from one function to another, whenever possible. This is similar in concept to the way data source functions used within your connector inherit their authentication context and credentials. In later lessons, you'll replace the use of [OData.Feed](/powerquery-m/odata-feed), which has native folding capabilities, with [Web.Contents](/powerquery-m/web-contents), which doesn't. To get the same level of capabilities, you'll need to use the `Table.View` interface and implement your own explicit folding logic.

## Loading your extension in Power BI Desktop

To use your extension in Power BI Desktop, you'll need to copy your connector project's output file (TripPin.mez) to your Custom Connectors directory.

1. Create a `[My Documents]\Power BI Desktop\Custom Connectors` directory.
2. Copy the extension file (**TripPin.mez**) into this directory.
3. Check the option **(Not Recommended) Allow any extension to load without validation or warning** in Power BI Desktop (under **File** > **Options and settings** > **Options** > **Security** > **Data Extensions**).
4. Restart Power BI Desktop.
5. Select **Get Data > More** to bring up the **Get Data** dialog.

You can locate your extension by typing its name into the search box.

![Get Data Dialog.](../../media/trippin1-get-data.png)

Select the function name, and select **Connect**. A third-party message appears&mdash;select **Continue** to continue. The function invocation dialog now appears. Enter the root URL of the service (`https://services.odata.org/v4/TripPinService/`), and select **OK**.

![Invoke Function.](../../media/trippin1-function.png)

Since this is the first time you're accessing this data source, you'll receive a prompt for credentials. Check that the shortest URL is selected, and then select **Connect**.

![Image of credential prompt set to Anonymous and the level setting set to the shortest URL.](../../media/trippin1-creds.png)

Notice that instead of getting a simple table of data, the navigator appears. This is because the [OData.Feed](/powerquery-m/odata-feed) function returns a table with special metadata on top of it that the Power Query experience knows to display as a navigation table. This walkthrough will cover how you can create and customize your own navigation table in a future lesson.

![Nav Table.](../../media/trippin1-nav-table.png)

Select the **Me** table, and then select **Transform Data**. Notice that the columns already have types assigned (well, most of them). This is another feature of the underlying [OData.Feed](/powerquery-m/odata-feed) function. If you watch the requests in [Fiddler](https://www.telerik.com/fiddler), you'll see that you've fetched the service's $metadata document. The engine's OData implementation does this automatically to determine the service's schema, data types, and relationships.

![Me Record.](../../media/trippin1-me.png)

## Conclusion

This lesson walked you through the creation of a simple connector based on the [OData.Feed](/powerquery-m/odata-feed) library function. As you saw, little logic is needed to enable a fully functional connector over the `OData` base function. Other extensibility enabled functions, such as [ODBC.DataSource](/powerquery-m/odbc-datasource), provide similar capabilities.

In the next lesson, you'll replace the use of [OData.Feed](/powerquery-m/odata-feed) with a less capable function&mdash;[Web.Contents](/powerquery-m/web-contents). Each lesson implements more connector features, including paging, metadata/schema detection, and query folding to the OData query syntax, until your custom connector supports the same range of capabilities as [OData.Feed](/powerquery-m/odata-feed).

## Next steps

[TripPin Part 2 - Data Connector for a REST Service](../2-rest/readme.md)
