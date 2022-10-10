let
    Source = SapHana.Database(“someserver:someport”, [Implementation="2.0"]),
    Contents = Source{[Name="Contents"]}[Data],
    SHINE_CORE_SCHEMA.sap.hana.democontent.epm.models = Contents{[Name="SHINE_CORE_SCHEMA.sap.hana.democontent.epm.models"]}[Data],
    PURCHASE_ORDERS1 = SHINE_CORE_SCHEMA.sap.hana.democontent.epm.models{[Name="PURCHASE_ORDERS"]}[Data],
    #"Added Items" = Cube.Transform(PURCHASE_ORDERS1,
        {
            {Cube.AddAndExpandDimensionColumn, "[PURCHASE_ORDERS]", {"[HISTORY_CREATEDAT].[HISTORY_CREATEDAT].Attribute", "[Product_TypeCode].[Product_TypeCode].Attribute", "[Supplier_Country].[Supplier_Country].Attribute"}, {"HISTORY_CREATEDAT", "Product_TypeCode", "Supplier_Country"}},
            {Cube.AddMeasureColumn, "Product_Price", "[Measures].[Product_Price]"}
        }),
    #"Inserted Year" = Table.AddColumn(#"Added Items", "Year", each Date.Year([HISTORY_CREATEDAT]), Int64.Type),
    #"Filtered Rows" = Table.SelectRows(#"Inserted Year", each ([Product_TypeCode] = "PR")),
    #"Added Conditional Column" = Table.AddColumn(#"Filtered Rows", "Region", each if [Supplier_Country] = "US" then "North America" else if [Supplier_Country] = "CA" then "North America" else if [Supplier_Country] = "MX" then "North America" else "Rest of world"),
    #"Filtered Rows1" = Table.SelectRows(#"Added Conditional Column", each ([Region] = "North America")),
    #"Collapsed and Removed Columns" = Cube.CollapseAndRemoveColumns(#"Filtered Rows1", {"HISTORY_CREATEDAT", "Product_TypeCode"})
in
    #"Collapsed and Removed Columns"