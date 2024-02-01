---
title: SAP Business Warehouse fundamentals
description: Describes basic SAP BW architecture and terminology used when interacting with the Power Query SAP Business Warehouse connector.
author: dougklopfenstein
ms.topic: conceptual
ms.date: 1/8/2024
ms.author: dougklo
---

# SAP BW fundamentals

This article describes basic terminology used when describing interactions between the SAP BW server and Power Query. It also includes information about tools that you may find useful when using the Power Query SAP BW connector.

## Integration Architecture

From a technical point of view, the integration between applications and SAP BW is based on the so-called Online Analytical Processing (OLAP) Business Application Programming Interfaces (BAPI).

The OLAP BAPIs are delivered with SAP BW and provide 3rd-parties and developers with standardized interfaces that enable them to access the data and metadata of SAP BW with their own front-end tools.

Applications of all types can be connected with an SAP BW server using these methods.

The OLAP BAPIs are implemented in SAP BW as RFC-enabled function modules and are invoked by applications over SAP’s RFC protocol. This requires the [NetWeaver RFC Library or SAP .NET Connector](application-setup-and-connect.md#prerequisites) to be installed on the application's machine. 

The OLAP BAPIs provide methods for browsing metadata and master data, and also for passing MDX statements for execution to the MDX Processor.

The OLAP Processor is responsible for retrieving, processing, and formatting the data from the SAP BW source objects, which are further described in [SAP BW data source](#sap-bw-data-sources) and [Data objects in SAP BW](#data-objects-in-sap-bw).

![Integration architecture.](integration-architecture.png)

SAP Business Explorer and other SAP tools use a more direct interface to the SAP BW OLAP Processor called Business Intelligence Consumer Services, commonly known as BICS. BICS isn't available for 3rd party tools.

## SAP BW data sources

The OLAP BAPIs provide 3rd party applications with access to SAP BW InfoProviders and BEx Queries.

Typically, when a 3rd party tool like Power Query connects using the OLAP BAPIs, SAP BW first responds with a list of catalogs available in the SAP BW system.

There's one catalog with the technical name `$INFOCUBE` that contains all InfoProviders in the SAP BW system. This catalog is shown as a node in the navigator of Power Query. By expanding this node in the navigator, you can select from the available InfoProviders in the SAP BW system.

The other catalogs represent InfoProviders for which at least one Query exists. By expanding one of these nodes in the navigator, you can select from the available queries associated with the InfoProvider.

BEx Queries offer some advantages and additional functionality to create customized data sources to meet end-user requirements. For example, you can parameterize queries with variables that can limit the data set to what's important to the end user. Or, you can recalculate key figures using formulas.

Although BEx Queries have advantages as data sources (go to [Performance considerations](implementation-details.md#performance-considerations)), you don't need a Query for every report. You'll need to weigh the cost of developing and maintaining additional Queries against their reporting requirements.

## Data objects in SAP BW

SAP BW comes with built-in tools for creating data models based on different data objects. It's helpful to have a rudimentary understanding of how data is represented in SAP BW and the terminology. The main data objects in SAP BW are briefly introduced here:

* **InfoProvider**  is the generic term for a Business Intelligence (BI) object into which data is loaded or which provides views of data. InfoProviders can be queried with client tools, such as Business Explorer (or BEx) and also with Power Query.

   InfoProviders can be seen as uniform data providers from the viewpoint of a query definition. Their data can therefore be analyzed in a uniform way.

* **InfoCube** is a type of InfoProvider. An InfoCube describes, from an analysis point of view, a self-contained data set, for a business-orientated area, for example Purchasing. You can analyze an InfoCube directly as an InfoProvider with analysis and reporting tools, including Power BI or Power Platform apps.

   An InfoCube consists of a set of relational tables that are arranged according to an enhanced star schema. This means there's a (large) fact table that contains the key figures for the InfoCube, and also several (smaller) dimension tables that surround it.

* **Key figure** is an operational attribute that indicates a numerical measure such as amount, weight, quantity, and so on.

* **Dimension** is a grouping of related **characteristics** under a single generic term. For example, the *Customer* dimension could be made up of the *Customer Number*, the *Customer Group*, and the levels of the customer hierarchy.

   A *Sales* dimension could contain the characteristics *Sales Person*, *Sales Group*, and *Sales Office*.

   A *Time* dimension could have the characteristics *Day* (in the form YYYYMMDD), *Week* (in the form YYYY.WW), *Month* (in the form YYYY.MM), *Year* (in the form YYYY) and *Fiscal Period* (in the form YYYY.PPP).

* **Characteristics** refer to master data with their **attributes** and **text descriptions**, and in some cases **hierarchies**. The characteristics of an InfoCube are stored in dimensions.

   For example, the *Customer* dimension could have the characteristics *Sold-to-party*, *Ship-to-party*, and *Payer*.

   The characteristic *Sold-to-party* could have the attributes *Country*, *Region*, *City*, *Street*, and *Industry*. The text description of the characteristic would be the *Name* of the *Sold-to-party*.

   In MDX query terms, the attributes of characteristics are also referred to as **properties**.

* **InfoObjects** is the generic term for all characteristics and key figures. All InfoObjects are maintained independently of the InfoCube in SAP BW. InfoObjects are the smallest units of Business Intelligence (BI). Using InfoObjects, information can be stored and mapped in a structured form. This is required for constructing InfoProviders. InfoObjects with attributes or texts can themselves be InfoProviders.

* **DataStore Object (DSO)** serves as a storage location for consolidated and cleansed transaction data or master data on a document (atomic) level. Unlike the multidimensional data in InfoCubes, the data in DataStore objects is stored in transparent, flat database tables. The system doesn't create separate fact tables or dimension tables for DSOs. Data in DSOs can be evaluated using a BEx query.

* **MultiProviders** are a special type of InfoProvider that combine data from several InfoProviders. They're then available for reporting. MultiProviders don't contain any data, their data comes exclusively from the InfoProviders upon which they're based. MultiProviders can be based upon any combination of InfoProviders, including InfoCubes, DataStore Objects, InfoObjects, or InfoSets.

* **InfoSets** are a special type of InfoProvider that doesn't store data physically. InfoSets describe data that's based on joining the tables of other InfoProviders like DataStore Objects, standard InfoCubes, or InfoObjects with master data characteristics. InfoSets can be useful when you have to build a report spanning two or more different data targets in SAP BW.

**Composite Providers** are a new data object in SAP BW systems that run on HANA, that is, SAP BW 7.5 or BW4/HANA. A composite provider is based on a JOIN or UNION of other InfoProviders or Analytic Indexes. Data in Composite Providers can be evaluated using a BEx query.

### See also

* [Navigate the query objects](navigate-query-objects.md)
