let
    Source = Value.NativeQuery(
        SapHana.Database(Server, [Implementation="2.0"]), 
    "select
        ""COL_VARCHAR"" as ""COL_VARCHAR"",
        ""ID"" as ""ID"",
        sum(""DECIMAL_MEASURE"") as ""DECIMAL_MEASURE""
    from ""_SYS_BIC"".""DEMO/CV_ALLTYPES""
    where
        ""COL_ALPHANUM"" = ? or
        ""COL_BIGINT"" = ? or
        ""COL_BINARY"" = ? or
        ""COL_BOOLEAN"" = ? or
        ""COL_DATE"" = ?
    group by 
        ""COL_ALPHANUM"",
        ""COL_BIGINT"",
        ""COL_BINARY"",
        ""COL_BOOLEAN"",
        ""COL_DATE"",
       {
            [ SqlType = "CHAR", Value = "M" ],                                                // COL_ALPHANUM - CHAR
            [ SqlType = "BIGINT", Value = 4 ],                                                // COL_BIGINT - BIGINT
            [ SqlType = "BINARY", Value = Binary.FromText("AKvN", BinaryEncoding.Base64) ],   // COL_BINARY - BINARY
            [ SqlType = "BOOLEAN", Value = true ],                                            // COL_BOOLEAN - BOOLEAN
            [ SqlType = "DATE", Value = #date(2022, 5, 27) ],                                 // COL_DATE - TYPE_DATE
        } ,
        [EnableFolding=false]
    )
in
    Source