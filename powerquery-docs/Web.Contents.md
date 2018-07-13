# Web.Contents
[`Web.Contents`](https://msdn.microsoft.com/library/mt260892.aspx) is the primary way to access web-based data that doesn't offer an OData specification. This requires more effort--depending on what the API is expecting, you'll have to specify a number of different options (documented in detail in the function).

Using `Web.Contents` as opposed to the OData specification means that you will have to handle navigation and schema functionality in your connector, rather than having it immediately available. This will require additional work, documented in [Handling Navigation]() and [Handling Schemas]().

>**Note:** What is returned by Web.Contents is the binary value. To get usable information out of it, you will have to convert it. In the below example, after the binary for a url passed in as a parameter is acquired, it's converted to json via the [`Json.Document`](https://msdn.microsoft.com/en-us/query-bi/m/json-document) function. The resulting Record will then still need to be turned into a table.
```
TripPinImpl = (url as text) =>
    let
        source = Web.Contents(url, [ Headers = DefaultRequestHeaders ]),
        json = Json.Document(source)
    in
        json;
```

TODO: Add common optional arguments to Web.Contents:
 - ManualStatusHandling = {500, 502}
 - Content = Binary...
 - Headers = []

TODO: Add section about Binary.Buffer?

TODO: Mention that Header/Code/etc. can be found in `meta` record

TODO: Mention that GET is default, POST happens when Content provided