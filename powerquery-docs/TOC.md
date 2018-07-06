# M Custom Connector Documentation

## PowerQuery SDK

* [Installing the PowerQuery SDK](InstallingSDK.md)
* [Starting to Develop Custom Connectors](StartingToDevelopCustomConnectors.md)
* [Creating your first connector: Hello World](CreatingFirstConnector.md)
* [Connector Development Reference]
    * [Handling Authentication](HandlingAuthentication.md)
    	* [Anonymous](ImplicitAuthentication.md)
    	* [Token](KeyAuthentication.md)
    	* [OAuth1.0](OAuth1.0Authentication.md)
    	* [OAuth2.0](OAuth2.0Authentication.md)
	* [Windows Authentication](WindowsAuthentication.md)
    	* [ResourcePath](ResourcePath.md)
    * [Handling Data Access](HandlingDataAccess.md)
    	* [Web.Contents](Web.Contents.md)
    	* [ODATA](Odata.Feed.md)
    	* ~Swagger~
    	* [ODBC](Odbc.DataSource.md)
	* [OleDb](OleDb.DataSource.md)
	* ~[Ado.Net](AdoDotNet.DataSource.md)~
    * [Handling Paging](HandlingPaging.md)
    	* NextUrl
    	* ~Cursor: Records~
    	* ~Cursor: Date~
    * Handling Request/Queue/Response (Query/Poll?) (Cube-like?) [BA]
    * [Handling Transformations](Transformations.md)
    	* [Static](Transformations.md#static-transformations)
    	* [Dynamic](Transformations.md#dynamic-transformations)
    * [Handling Schemas](HandlingSchema.md)
    	* Hard-coded schema(HandlingSchema.md#simple-hardcoded-approach)
    	* Table type based schema(HandlingSchema.md#sophisticated-approach)
    * [Handling Status Codes](HandlingStatusCodes.md) [perhaps "handling Non-200 REST responses or something-BA]
    	* [Wait-retry](WaitRetry.md)
    	* [Handling Errors](HandlingErrors.md)
    * [Handling Unit Testing](HandlingUnitTesting.md)
    * [~Handling Query Folding~](HandlingQueryFolding.md)
    * ~[Handling User-set Parameters](HandlingParameters.md)~
    * ~Handling Connector Parameters~
    	* ~DOP~
    * ~Common Patterns~
    	* ~Table.Generate~
    	* ~Value.WaitFor~
    	* ~GetHost~
* ~Best Practices~
	* ~Function Naming~
	* ~Parameters~
	* ~API Design~
	* ~Troubleshooting~
    * ~Common Errors~
    * [Handling Documentation](HandlingDocumentation.md)
    * [Handling Navigation Tables](HandlingNavigationTables.md)
* Certification
