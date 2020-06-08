# What licenses do you need in order to use dataflows?

Dataflows coming in different types, such as Power BI dataflows and Power Platform dataflows, Analytical and Standard dataflows, Internal and External dataflows. You can create dataflows in multiple environments. Considering this wide range of places that you can use dataflows, it is important to know what licensing options do you need to use dataflows? this article is explaining that.

## Power BI dataflows

If you want to create dataflows in Power BI environments, you do need to have a paid license for Power BI. Power BI free license unfortunately won't give you the ability to create dataflows. You need to have either Power BI pro account, or be part of a premium or embedded capacity. Although, being part of the premium or embedded capacity itself, won't allow you to create a dataflow, you would still need the pro account to create the dataflow.

Power BI pro account is available on a user-monthly-basis option available.

and there are multiple options for the dedicated capacity such as what mentioned here.

## Power Platform dataflows

If you wish to create dataflows in Power Platform environment, then there are two options for you. If you create standard dataflows, you won't need any other license than the Power Apps (per user or per app) license, because that will give you the ability to use Common Data Services.

If you wish to create analytical dataflows in Power Platform environment, then you need to bring your own storage account, which is explained in the next section, in addition to having Power Apps license, you do need to have an Azure subscription.

## Using your own storage account

If you are using your own storage account, and connected that to the dataflow you are creating, then you do need to have a separate Azure Data Lake Storage Gen 2 subscription, this can be part of your Azure licensing and subscription.

## Premium features

Some of the dataflow features are limited to premium capacity in Power BI. If you want to use the enhanced compute engine to speed up your dataflow queries performance over computed entities, or have DirectQuery connection option to the dataflow, you need to have Power BI capacity A3 or higher.

AI functions, linked entity and computed entity are all premium functions which are not available with Power BI pro account.

## Features

Below is a list of features and the license needed for them to be available.

| Feature                                         | License                                                      |
| ----------------------------------------------- | ------------------------------------------------------------ |
| Standard dataflow                               | Power Apps, Per app plan<br />Power Apps, Per user plan      |
| Analytical dataflow (using internal storage)    | Power BI Pro<br />Power BI Premium                           |
| Analytical dataflow (bring your own ADLS gen 2) | Power BI Pro<br /><br />Power Apps<br />Azure Subscription for the ADLS gen 2 |
| The enhanced compute engine                     | Power BI Premium (A3 or above)                               |
| DirectQuery connection to dataflow              | Power BI Premium (A3 or above)                               |
| AI Functions                                    | Power BI Premium                                             |
| Linked and Computed Entities                    | Power BI Premium<br />Azure Subscription for the ADLS gen 2  |

## Limitations on each license

The table above, shows what feature each license will give you, but not the detail of it. below is the details about some of the limitations.

### Power Apps Licenses

If you use the Power Apps license to create a standard dataflow, there is no limitation on the number of dataflows and entities you want to create, However, there is a limitation on the size of Common Data Service you can use;

The Power Apps per app plan, covers up to 50 MB database capacity, and the per user plan allows you to have a database of 250 MB capacity.

### Power BI Pro

Power BI Pro only gives you the ability to create analytical dataflows, but not any of the premium features. Using Power BI pro account, you cannot use linked, or computed entity, you cannot use AI functions, and cannot use DirectQuery to the dataflow. The storage for your dataflows is limited to the space left under your Power BI pro account which is a subset of 10 GB storage for all Power BI content.

### Power BI Premium

If you use Power BI Premium (capacity based licensing), you can use all the AI functions, and computed entity, and linked entity, with the ability to have DirectQuery connection to the dataflow, and the usage of the enhanced compute engine. However, the dataflow created under a premium capacity is using the internal ADLS gen2 storage, and won't be accessible by other platform except Power BI itself. You cannot create external dataflows just by having Power BI Premium license, you need to have an Azure subscription for ADLS gen2 as well. 

### Azure Data Lake Storage Gen 2

The subscription of ADLS gen2 is giving you the ability to create external analytical dataflows. The size of the storage would be only limited to your azure subscription license. However, having only ADLS gen2 won't give you the ability to create dataflows, you do need to have one of Power BI or Power Platform licenses to be able to author and create dataflows.

## Next step

If you want to read more in detail about the concepts, follow any of the links below;

### Pricing

- [Power BI Pricing](https://powerbi.microsoft.com/pricing/)
- [Power Platform Pricing](https://powerapps.microsoft.com/pricing/)
- [Azure Data Lake Storage Gen 2 Pricing](https://azure.microsoft.com/pricing/details/storage/data-lake/)

### Features

- [Computed entity](computed-entities.md)
- [Linked entity](linked-entities.md)
- [AI features in dataflow](https://docs.microsoft.com/power-bi/service-machine-learning-automated)
- [Standard vs analytical dataflow](understanding-differences-between-analytical-standard-dataflows.md)
- [The enhanced compute engine](https://docs.microsoft.com/power-bi/transform-model/service-dataflows-enhanced-compute-engine)