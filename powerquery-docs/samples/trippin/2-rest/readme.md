---
title: TripPin 2 - REST
description: Starting a REST connector for the TripPin sample service
author: ptyx507x
ms.topic: tutorial
ms.date: 11/25/2025
ms.author: miescobar
ms.subservice: custom-connectors
ms.custom: sfi-image-nochange
---

# TripPin part 2 - Data connector for a REST service

This multi-part tutorial covers the creation of a new data source extension for Power Query. The tutorial is meant to be done sequentially&mdash;each lesson builds on the connector created in previous lessons, incrementally adding new capabilities to your connector.

In this lesson, you:

> [!div class="checklist"]
> * Create a base function that calls out to a REST API using [Web.Contents](/powerquery-m/web-contents)
> * Learn how to set request headers and process a JSON response
> * Use Power BI Desktop to wrangle the response into a user friendly format

This lesson converts the OData based connector for the [TripPin service](https://services.odata.org/v4/TripPinService/) (created in the [previous lesson](../1-odata/readme.md)) to a connector that resembles something you would create for any RESTful API. OData is a RESTful API, but one with a fixed set of conventions. The advantage of OData is that it provides a schema, data retrieval protocol, and standard query language. Taking away the use of [OData.Feed](/powerquery-m/odata-feed) require you to build these capabilities into the connector yourself.

## Recap of the OData connector

Before you remove the OData functions from your connector, let's do a quick review of what it currently does (mostly behind the scenes) to retrieve data from the service.

Open the TripPin extension project from [Part 1](../1-odata/readme.md) in Visual Studio Code. Open the Query file and paste in the following query:

```
TripPin.Feed("https://services.odata.org/v4/TripPinService/Me")
```

Open Fiddler and then evaluate the current Power Query file in Visual Studio Code.

In Fiddler, there are three requests to the server:

:::image type="content" source="../../media/trippin2-fiddler.png" alt-text="Screenshot of the Fiddler output screen with the three OData requests displayed.":::

* `/Me`: The actual URL you're requesting.
* `/$metadata`: A call automatically made by the `OData.Feed` function to determine schema and type information about the response.
* `/Me/BestFriend`: One of the fields that was (eagerly) pulled when you listed the /Me singleton. In this case, the call resulted in a `204 No Content` status.

M evaluation is mostly lazy. In most cases, data values are only retrieved/pulled when they're needed. There are scenarios (like the /Me/BestFriend case) where a value is pulled eagerly. This behavior tends to occur when type information is needed for a member, and the engine has no other way to determine the type than to retrieve the value and inspect it. Making things lazy (that is, avoiding eager pulls) is one of the key aspects to making an M connector performant.

Take a look at the request headers that were sent along with the requests and the JSON format of the response of the /Me request.

```json
{
  "@odata.context": "https://services.odata.org/v4/TripPinService/$metadata#Me",
  "UserName": "aprilcline",
  "FirstName": "April",
  "LastName": "Cline",
  "MiddleName": null,
  "Gender": "Female",
  "Age": null,
  "Emails": [ "April@example.com", "April@contoso.com" ],
  "FavoriteFeature": "Feature1",
  "Features": [ ],
  "AddressInfo": [
    {
      "Address": "P.O. Box 555",
      "City": {
        "Name": "Lander",
        "CountryRegion": "United States",
        "Region": "WY"
      }
    }
  ],
  "HomeAddress": null
}
```

When the query finishes evaluating, the PQTest result window should show the Record value for the Me singleton.

:::image type="content" source="../../media/trippin2-odata-result.png" alt-text="Screenshot of the PQTest result showing the Record value for the Me singleton.":::

If you compare the fields in the output window with the fields returned in the raw JSON response, you notice a mismatch. The query result has other fields (`Friends`, `Trips`, `GetFriendsTrips`) that don't appear anywhere in the JSON response. The [OData.Feed](/powerquery-m/odata-feed) function automatically appended these fields to the record based on the schema returned by $metadata. This difference is a good example of how a connector might augment and/or reformat the response from the service to provide a better user experience.

## Creating a basic REST connector

Now add a new exported function to your connector that calls [Web.Contents](/powerquery-m/web-contents).

To make successful web requests to the OData service, however, you have to set some [standard OData headers](https://docs.oasis-open.org/odata/odata/v4.0/os/part1-protocol/odata-v4.0-os-part1-protocol.html#_Toc372793609). You do this by defining a common set of headers as a new variable in your connector:

```powerquery-m
DefaultRequestHeaders = [
    #"Accept" = "application/json;odata.metadata=minimal",  // column name and values only
    #"OData-MaxVersion" = "4.0"                             // we only support v4
];
```

You change your implementation of your `TripPin.Feed` function so that rather than using `OData.Feed`, it uses [Web.Contents](/powerquery-m/web-contents) to make a web request, and parses the result as a JSON document.

```powerquery-m
TripPinImpl = (url as text) =>
    let
        source = Web.Contents(url, [ Headers = DefaultRequestHeaders ]),
        json = Json.Document(source)
    in
        json;
```

Remember to build your connector now that you made changes to the connector file. Then you can evaluate the query file (TripPin.query.pq). The result of the /Me record now resembles the raw JSON that was in the Fiddler request.

If you watch Fiddler when running the new function, you also notice that the evaluation now makes a single web request, rather than three. Congratulations&mdash;you achieved a 300% performance increase! You now lost all the type and schema information, but there's no need to focus on that part yet.

Update your query to access some of the TripPin Entities/Tables, such as:

* `https://services.odata.org/v4/TripPinService/Airlines`
* `https://services.odata.org/v4/TripPinService/Airports`
* `https://services.odata.org/v4/TripPinService/Me/Trips`

You notice that the paths that used to return nicely formatted tables now return a top level "value" field with an embedded [List]. You need to do some transformations on the result to make it usable for end user consumption scenarios.

:::image type="content" source="../../media/trippin2-raw-list.png" alt-text="Screenshot of the PQTest result with a value field containing an embedded list.":::

## Authoring transformations in Power Query

While it's possible to author your M transformations by hand, most people prefer to use Power Query to shape their data. You open your extension in Power BI Desktop and use it to design queries to turn the output into a more user friendly format. Rebuild your solution, copy the new extension file to your Custom Data Connectors directory, and relaunch Power BI Desktop.

Start a new Blank Query, and paste the following line into the formula bar:

`= TripPin.Feed("https://services.odata.org/v4/TripPinService/Airlines")`

Be sure to include the = sign.

Manipulate the output until it looks like the original OData feed&mdash;a table with two columns: AirlineCode and Name.

:::image type="content" source="../../media/trippin2-airlines.png" alt-text="Screenshot of a Power Query table containing the AirlineCode and Name columns.":::

The resulting query should look something like this:

```powerquery-m
let
    Source = TripPin.Feed("https://services.odata.org/v4/TripPinService/Airlines"),
    value = Source[value],
    toTable = Table.FromList(value, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    expand = Table.ExpandRecordColumn(toTable, "Column1", {"AirlineCode", "Name"}, {"AirlineCode", "Name"})
in
    expand
```

Give the query a name ("Airlines").

Create a new Blank Query. This time, use the `TripPin.Feed` function to access the /Airports entity. Apply transforms until you get something similar to the following table. The matching query follows the table&mdash;give this query a name ("Airports") as well.

:::image type="content" source="../../media/trippin2-airports.png" alt-text="Screenshot of a Power Query table containing the transformed table." lightbox="../../media/trippin2-airports.png":::

```powerquery-m
let
    Source = TripPin.Feed("https://services.odata.org/v4/TripPinService/Airports"),
    value = Source[value],
    #"Converted to Table" = Table.FromList(value, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to Table", "Column1", {"Name", "IcaoCode", "IataCode", "Location"}, {"Name", "IcaoCode", "IataCode", "Location"}),
    #"Expanded Location" = Table.ExpandRecordColumn(#"Expanded Column1", "Location", {"Address", "Loc", "City"}, {"Address", "Loc", "City"}),
    #"Expanded City" = Table.ExpandRecordColumn(#"Expanded Location", "City", {"Name", "CountryRegion", "Region"}, {"Name.1", "CountryRegion", "Region"}),
    #"Renamed Columns" = Table.RenameColumns(#"Expanded City",{{"Name.1", "City"}}),
    #"Expanded Loc" = Table.ExpandRecordColumn(#"Renamed Columns", "Loc", {"coordinates"}, {"coordinates"}),
    #"Added Custom" = Table.AddColumn(#"Expanded Loc", "Latitude", each [coordinates]{1}),
    #"Added Custom1" = Table.AddColumn(#"Added Custom", "Longitude", each [coordinates]{0}),
    #"Removed Columns" = Table.RemoveColumns(#"Added Custom1",{"coordinates"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Columns",{{"Name", type text}, {"IcaoCode", type text}, {"IataCode", type text}, {"Address", type text}, {"City", type text}, {"CountryRegion", type text}, {"Region", type text}, {"Latitude", type number}, {"Longitude", type number}})
in
    #"Changed Type"
```

You can repeat this process for more paths under the service. Once you're ready, move onto the next step of creating a (mock) navigation table.

## Simulating a navigation table

Now you're going to build a table (using M code) that presents your nicely formatted TripPin entities.

Start a new Blank Query and bring up the advanced editor.

Paste in the following query:

```powerquery-m
let
    source = #table({"Name", "Data"}, {
        { "Airlines", Airlines },
        { "Airports", Airports }
    })
in
    source
```

If you didn't set your Privacy Levels setting to "Always ignore Privacy level settings" (also known as "Fast Combine"), a privacy prompt is displayed.

:::image type="content" source="../../media/trippin2-firewall.png" alt-text="Screenshot of the Power Query privacy prompt.":::

Privacy prompts appear when you're combining data from multiple sources and didn't a privacy level for one or more sources. Select the **Continue** button and set the privacy level of the top source to **Public**.

:::image type="content" source="../../media/trippin2-privacy.png" alt-text="Screenshot of the Privacy levels dialog where you set the privacy level of the top source to Public.":::

Select **Save** and your table appears. While this table isn't a navigation table yet, it provides the basic functionality you need to turn it into one in a subsequent lesson.

:::image type="content" source="../../media/trippin2-fake-nav.png" alt-text="Screenshot of the table containing the TripPin data.":::

Data combination checks don't occur when accessing multiple data sources from within an extension. Since all data source calls made from within the extension inherit the same authorization context, the assumption is they are "safe" to combine. Your extension is always treated as a single data source when it comes to data combination rules. Users would still receive the regular privacy prompts when combining your source with other M sources.

If you run Fiddler and select the **Refresh Preview** button in the Power Query editor, note the separate web requests for each item in your navigation table. These separate requests indicate that an eager evaluation is occurring, which isn't ideal when building navigation tables with many elements. Subsequent lessons show how to build a proper navigation table that supports lazy evaluation.

## Conclusion

This lesson showed you how to build a simple connector for a REST service. In this case, you turned an existing OData extension into a standard REST extension (using [Web.Contents](/powerquery-m/web-contents)), but the same concepts apply if you're creating a new extension from scratch.

In the next lesson, you take the queries created in this lesson using Power BI Desktop and turn them into a true navigation table within the extension.

## Next steps

[TripPin Part 3 - Navigation Tables](../3-navtables/readme.md)
