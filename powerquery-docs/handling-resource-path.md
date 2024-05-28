---
title: Using a Data source path for Power Query connectors
description: Use a Data source path for Power Query connectors
author: ptyx507x
ms.topic: conceptual
ms.date: 5/15/2024
ms.author: miescobar
---

# Handling Data source path

The M engine identifies a data source using a combination of its _Kind_ and _Path_. When a data source is encountered during a query evaluation, the M engine tries to find matching credentials. If no credentials are found, the engine returns a special error that results in a credential prompt in Power Query.

The _Kind_ value comes from the [Data Source Kind](HandlingDataAccess.md#data-source-kind) definition.

The _Path_ value is derived from the _required parameters_ of your [data source function](HandlingDataAccess.md#data-source-functions). Optional parameters aren't factored into the data source path identifier. As a result, all data source functions associated with a data source kind must have the same parameters. There's special handling for functions that have a single parameter of type `Uri.Type`. Go to [Functions with a Uri parameter](#functions-with-a-uri-parameter) for details.

You can see an example of how credentials are stored in the **Data source settings** dialog in Power BI Desktop. In this dialog, the Kind is represented by an icon, and the Path value is displayed as text.

:::image type="content" source="media/handling-authentication/data-source-settings-creds.png" alt-text="Screenshot of the data source settings credentials.":::

>[!NOTE]
> If you change your data source function's required parameters during development, previously stored credentials no longer work (because the path values no longer match). You should delete any stored credentials any time you change your data source function parameters. If incompatible credentials are found, you might receive an error at runtime.

## Data source path format

The _Path_ value for a data source is derived from the data source function's required parameters. Required parameters can be excluded from the path by adding `DataSource.Path = false` to the function's metadata. For more information, go to [Excluding required parameters from your data source path](#excluding-required-parameters-from-your-data-source-path).

By default, you can see the actual string value in the **Data source settings** dialog in Power BI Desktop, and in the credential prompt. If the Data Source Kind definition has included a `Label` value, you'll see the label value instead.

For example, the data source function in the [HelloWorldWithDocs sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorldWithDocs) has the following signature:

```powerquery-m
HelloWorldWithDocs.Contents = (message as text, optional count as number) as table => ...
```

The function has a single required parameter (`message`) of type `text`, and is used to calculate the data source path. The optional parameter (`count`) is ignored. The path would be displayed as follows:

### Credential prompt

:::image type="content" source="media/handling-authentication/credential-prompt-with-path.png" alt-text="Screenshot of the credential prompt with path.":::

### Data source settings UI

:::image type="content" source="media/handling-authentication/data-source-settings-json.png" alt-text="Screenshot of the data source settings UI.":::

When a Label value is defined, the data source path value isn't shown:

:::image type="content" source="media/handling-authentication/data-source-settings-label.png" alt-text="Screenshot of the data source settings with a label defined.":::

>[!NOTE]
> We currently recommend that you _do not_ include a Label for your data source if your function has required parameters, as users won't be able to distinguish between the different credentials they've entered. We are hoping to improve this in the future (that is, allowing data connectors to display their own custom data source paths).

### Excluding required parameters from your data source path

If you want a function parameter to be required, but not to be included as part of your data source path, you can add `DataSource.Path = false` to the function documentation metadata. This property can be added to one or more parameters for your function. This field removes the value from your data source path (meaning that it's no longer passed to your `TestConnection` function), so it should only be used for parameters that aren't required to identify your data source, or distinguish between user credentials.

For example, the connector in the [HelloWorldWithDocs sample](https://github.com/Microsoft/DataConnectors/tree/master/samples/HelloWorldWithDocs) would require different credentials for different `message` values.
Adding `DataSource.Path = false` to the `message` parameter removes it from the data source path calculation, effectively making the connector a "singleton". All calls to `HelloWorldWithDocs.Contents` are treated as the same data source, and the user only provides credentials once.

```powerquery-m
HelloWorldType = type function (
    message as (type text meta [
        DataSource.Path = false,
        Documentation.FieldCaption = "Message",
        Documentation.FieldDescription = "Text to display",
        Documentation.SampleValues = {"Hello world", "Hola mundo"}
    ]),
    optional count as (type number meta [
        Documentation.FieldCaption = "Count",
        Documentation.FieldDescription = "Number of times to repeat the message",
        Documentation.AllowedValues = { 1, 2, 3 }
    ]))
    as table meta [
        Documentation.Name = "Hello - Name",
        Documentation.LongDescription = "Hello - Long Description",
        Documentation.Examples = {[
            Description = "Returns a table with 'Hello world' repeated 2 times",
            Code = "HelloWorldWithDocs.Contents(""Hello world"", 2)",
            Result = "#table({""Column1""}, {{""Hello world""}, {""Hello world""}})"
        ],[
            Description = "Another example, new message, new count!",
            Code = "HelloWorldWithDocs.Contents(""Goodbye"", 1)",
            Result = "#table({""Column1""}, {{""Goodbye""}})"
        ]}
    ];
```

## Functions with a Uri parameter

Because data sources with a Uri based identifier are so common, there's special handling in the Power Query UI when dealing with Uri-based data source paths. When a Uri-based data source is encountered, the credential dialog provides a dropdown, which allows the user to select the base path rather than the full path (and all paths in-between).

:::image type="content" source="media/handling-authentication/credential-prompt-with-url.png" alt-text="Screenshot of the credential dialog showing the setting path that credentials apply to.":::

As `Uri.Type` is an _ascribed type_ rather than a _primitive type_ in the M language, you'll need to use the [Value.ReplaceType](/powerquery-m/value-replacetype) function to indicate that your text parameter should be treated as a Uri.

```powerquery-m
shared GithubSample.Contents = Value.ReplaceType(Github.Contents, type function (url as Uri.type) as any);
```
