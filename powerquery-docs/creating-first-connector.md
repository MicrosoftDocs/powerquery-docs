---
title: Creating your first connector - Hello World
description: Create your first connector
author: ptyx507x
ms.date: 11/27/2019
ms.author: miescobar
ms.custom: intro-internal
---

# Creating your first connector: Hello World

## Hello World sample
This sample provides a simple data source extension that can be run in Visual Studio, and loaded in Power BI Desktop. As an overview, this sample shows the following:
* Exporting function (`HelloWorld.Contents`), which takes an option text parameter.
* Defining a data source kind that:
    * Declares that it uses Implicit (anonymous) authentication.
    * Uses string resources that allow for localization.
    * Declaring UI metadata so the extension can show up in the Power BI Desktop Get Data dialog.

Following the instructions in [Installing the PowerQuery SDK](InstallingSDK.md), create a new project called "HelloWorld" and copy in the following M code, and then follow the rest of the instructions to be able to open it in PowerBI.

In the following connector definition you'll find:
* A `section` statement.
* A data source function with metadata establishing it as a data source definition with the Kind `HelloWorld` and Publish `HelloWorld.Publish`.
* An `Authentication` record declaring that implicit (anonymous) is the only authentication type for this source.
* A publish record declaring that this connection is in Beta, what text to load from the resx file, the source image, and the source type image.
* A record associating icon sizes with specific PNGs in the build folder.

```
section HelloWorld;
 
[DataSource.Kind="HelloWorld", Publish="HelloWorld.Publish"]
shared HelloWorld.Contents = (optional message as text) =>
    let
        message = if (message <> null) then message else "Hello world"
    in
        message;
 
HelloWorld = [
    Authentication = [
        Implicit = []
    ],
    Label = Extension.LoadString("DataSourceLabel")
];
 
HelloWorld.Publish = [
    Beta = true,
    ButtonText = { Extension.LoadString("FormulaTitle"), Extension.LoadString("FormulaHelp") },
    SourceImage = HelloWorld.Icons,
    SourceTypeImage = HelloWorld.Icons
];
 
HelloWorld.Icons = [
    Icon16 = { Extension.Contents("HelloWorld16.png"), Extension.Contents("HelloWorld20.png"), Extension.Contents("HelloWorld24.png"), Extension.Contents("HelloWorld32.png") },
    Icon32 = { Extension.Contents("HelloWorld32.png"), Extension.Contents("HelloWorld40.png"), Extension.Contents("HelloWorld48.png"), Extension.Contents("HelloWorld64.png") }
];
```

Once you've built the file and copied it to the correct directory, following the instructions in [Installing the PowerQuery SDK](InstallingSDK.md) tutorial, open PowerBI. You can search for "hello" to find your connector in the **Get Data** dialog. 



This step will bring up an authentication dialog. Since there's no authentication options and the function takes no parameters, there's no further steps in these dialogs.



Press **Connect** and the dialog will tell you that it's a "Preview connector", since `Beta` is set to true in the query. Since there's no authentication, the authentication screen will present a tab for Anonymous authentication with no fields. Press **Connect** again to finish.

Finally, the query editor will come up showing what you expect&mdash;a function that returns the text "Hello world".

For the fully implemented sample, see the [Hello World Sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorld) in the Data Connectors sample repo.
