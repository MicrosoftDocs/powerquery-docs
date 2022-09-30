Value.NativeQuery(
        SapHana.Database(
            "Pbihanadb1.westus.cloudapp.azure.com:30015", 
            [Implementation = "2.0"]
        ), 
        "select ""VARCHAR_VAL"" as ""VARCHAR_VAL""
from ""_SYS_BIC"".""DirectQueryTest1MB_sandbox.PBIDesktopTestTeam.DSyrkin/CV_ALL_TYPES""
where ""VARCHAR_VAL"" = ? and ""DATE_VAL"" = ?
group by ""VARCHAR_VAL""
", 
        {"Seattle", #date(1957, 6, 13)}, 
        [EnableFolding = true]
    )
