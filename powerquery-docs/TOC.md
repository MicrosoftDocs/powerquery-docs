# M Custom Connector Documentation

## PowerQuery SDK

* [Installing the PowerQuery SDK](InstallingSDK.md)
* Starting to Develop Custom Connectors
* [Creating your first connector: Hello World](CreatingFirstConnector.md)
* [Connector Development Reference]
    * [Handling Authentication](HandlingAuthentication.md)
    	* Anonymous
    	* Token
    	* OAuth1.0
    	* OAuth2.0
    	* ResourcePath
    * [Handling Data Access](HandlingDataAccess.md)
    	* [Web.Contents](Web.Contents.md)
    	* [ODATA](Odata.Feed.md)
    	* Swagger
    	* [ODBC](Odbc.DataSource.md)
    * [Handling Paging](HandlingPaging.md)
    	* NextUrl
    	* Cursor: Records
    	* Cursor: Date
    * Handling Request/Queue/Response (Query/Poll?) (Cube-like?) [BA]
    * [Handling Transformations](Transformations.md)
    	* [Static](Transformations.md#Static)
    	* Dynamic
    * Handling Schemas
    	* Static
    	* Dynamic
    * Handling Status Codes [perhaps "handling Non-200 REST responses or something-BA]
    	* Wait-retry
    	* Bubbling errors up to users
    * Handling Unit Testing
    * Handling Query Folding
    * Handling User-set Parameters
    * Handling Connector Parameters
    	* DOP
    * Common Patterns
    	* Table.Generate
    	* Value.WaitFor
    	* GetHost
* Best Practices
	* Function Naming
	* Parameters
	* API Design
	* Troubleshooting
    * Common Errors
    * Handling Documentation
    * Handling Navigation Tables
    	* Static
    	* Dynamic
* Certification