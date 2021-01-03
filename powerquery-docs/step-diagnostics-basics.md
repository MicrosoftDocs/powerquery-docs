Source:
For the SQL Connector, Source is opaque.
Why is it opaque? Because it’s represented in the engine as a catalog table value.

Opaque: it’s either:
1. A connector that’s not yet supported in the query plan (i.e. OData, and even for some of the OData cases we won’t end up here)
2. A transformation on top of a table that is not reflected in the query plan. This will improve with SU12 engine for several table operators. 
3. A true constant table. 

Unknown is either:
1. A non table value (record, list, primitive, ...)
2. An error while running step analysis (should be very rare)

1) Not folding: “This step will not be evaluated by the data source”.
2) Folding: “This step will be evaluated by the data source”.
3) Variable outcome: “This step might be evaluated by the data source”.

we are now previewing step folding indicators. These indicators will allow you to understand which steps fold, and which steps don't. When you make a change that breaks folding, it will become obvious. This will allow you to more easily resolve issues quickly, avoid performance issues in the first place, and have better insight into your queries.
