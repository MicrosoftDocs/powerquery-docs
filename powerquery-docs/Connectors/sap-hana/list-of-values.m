let
    Source = Value.NativeQuery(
        SapHana.Database(
            "myhanaserver:30015", 
            [Implementation = "2.0"]
        ), 
        "select ""VARCHAR_VAL"" as ""VARCHAR_VAL""
    from ""_SYS_BIC"".""DEMO/CV_ALL_TYPES""
    where ""VARCHAR_VAL"" = ? and ""DATE_VAL"" = ?
    group by ""VARCHAR_VAL""
    ", 
        {"Seattle", #date(1957, 6, 13)}, 
        [EnableFolding = true]
    )
in
    Source