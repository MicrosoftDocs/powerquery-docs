## Power Query experiences

The Power Query user experience is provided via the user interface or Power Query Editor. The goal of this interface is to help you apply your desired transformations by simply interacting with a user-friendly set of ribbons, menus, buttons and other set of interative components.

The Power Query Editor is the primary data preparation experience, allowing users to connecto to over 70 data sources and apply over 300 different data transformations by previewing data and selecting transformations in the user experience. These data transformation capabilities are common across all data sources, regardless of the underlying data source limitations.

When creating a new transformation step, by intercting with the components of the Power Query interface, Power Query will automatically create the M code required to perform such transformation without the need for you to write any code.
 
Currently there are two Power Query experiences available:
* **Power Query Online** - Found in integrations such as Power BI dataflows, Power Platform dataflows, Azure Data Factory Wrangling Dataflows, and many more that provide the experience through an online webpage.
* **Power Query for Desktop** - Found in integrations such as Power Query for Excel and Power BI Desktop. 

>[!Note]
>While these two experiences exist, they both provide almost the same user experience in every scenario.

## Product integrations

Power Query can be found in the following Microsoft products and services:

|Product|M engine|Power Query Desktop|Power Query Online|Dataflows|
|-------|---------|-------------------|------------------|---------|
|Excel for Windows|![Yes](images/me-checkmark-24px.png)|![Yes](images/me-checkmark-24px.png)|![No](images/me-cancel-24px.png)| ![No](images/me-cancel-24px.png)|
|Excel for Mac|![Yes](images/me-checkmark-24px.png)|![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)| ![No](images/me-cancel-24px.png)|
|Power BI|![Yes](images/me-checkmark-24px.png)|![Yes](images/me-checkmark-24px.png)|![Yes](images/me-checkmark-24px.png)| ![No](images/me-cancel-24px.png)
|Power Apps| ![Yes](images/me-checkmark-24px.png) |![No](images/me-cancel-24px.png)|![Yes](images/me-checkmark-24px.png)| ![Yes](images/me-checkmark-24px.png)||
|Power Automate| ![Yes](images/me-checkmark-24px.png) |![No](images/me-cancel-24px.png) | ![Yes](images/me-checkmark-24px.png) |![Yes](images/me-checkmark-24px.png)|
|Azure Data Factory| ![Yes](images/me-checkmark-24px.png) |![No](images/me-cancel-24px.png) |![Yes](images/me-checkmark-24px.png) |![Yes](images/me-checkmark-24px.png)|
|SQL Server Integration Services| ![Yes](images/me-checkmark-24px.png)| ![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|
|SQL Server Analysis Services| ![Yes](images/me-checkmark-24px.png)| ![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|![No](images/me-cancel-24px.png)|


|Label|Description|
|----|--|
|M engine| Power Query or M engine that evaluates the M code |
|Power Query Desktop| Power Query experience found inside of desktop applications|
|Power Query Online|Power Query experience found inside of web browser applications|
|Dataflows| ????|

## More resources
* [Data sources in Power Query](connectors.md)
* [Getting data](get-data-experience.md)
* [Power Query quickstart](power-query-quickstart-using-power-bi.md)
* [Shape and combine data using Power Query](power-query-tutorial-shape-combine.md)
* [What are dataflows](overview-dataflows-across-power-platform-dynamics-365.md)