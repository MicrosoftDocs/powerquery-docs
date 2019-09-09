# PostgreSQL

## Prerequisites
In order to connect to a PostgreSQL database with  **Power BI Desktop**, the correct Npgsql provider must be installed on the computer running Power BI Desktop.

**Supported versions**: Which Npgsql versions? Which PostgreSQL versions?

### Installing the Npgsql Provider
Details here
## Capabilities Supported
* Import
* Direct Query
* Advanced options
	* Command timeout in minutes
	* Native SQL statement
	* Relationship columns
	* Navigate using full hierarchy
## Connect to a PostgreSQL database
Once the matching Npgsql provider is installed, you can connect to a PostgreSQL database. To make the connection, take the following steps:

1.  From the Get Data window, select  **Database > PostgreSQL**
2. In the  **PostgreSQL**  dialog that appears, provide the name of the server and database. Optionally, you may provide a command timeout and a native query (SQL statement), as well as select whether or not you want to include relationship columns and navigate using full hierarchy. Once you are done, select  **Connect**.
3. If the PostgreSQL database requires database user credentials, input those credentials in the dialogue when prompted.
## Native Query Folding
To enable Native Query Folding, set the EnableFolding flag to "true" for [Value.NativeQuery()](https://docs.microsoft.com/en-us/powerquery-m/value-nativequery) in the advanced editor.
Sample:
```Value.NativeQuery(target as any, query, null, [EnableFolding=true])```

Operations that are capable of folding will be applied on top of your native query according to normal Import or Direct Query logic. Native Query folding is not applicable with optional parameters present in [Value.NativeQuery()](https://docs.microsoft.com/en-us/powerquery-m/value-nativequery).

## Troubleshooting
Your native query may throw the error:
```We cannot fold on top of this native query. Please modify the native query or remove the 'EnableFolding' option.```
A basic trouble shooting step is to check if the query in [Value.NativeQuery()](https://docs.microsoft.com/en-us/powerquery-m/value-nativequery) throws the same error with a limit 1 clause around it:
```select * from (query) _ limit 1```
