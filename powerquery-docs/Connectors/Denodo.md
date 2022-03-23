---
title: Power Query Denodo Connector
description: Provides basic information and prerequisites for the Denodo connector, descriptions of the optional input parameters, and discusses limitations and issues you might encounter.
author: bezhan-msft
ms.service: powerquery
ms.topic: conceptual
ms.date: 3/22/2022
ms.author: bezhan
LocalizationGroup: reference
---

# Denodo

>[!Note]
>The following connector article is provided by Denodo, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the Denodo website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products |  Power BI (Datasets)<br/>|
| Authentication Types Supported | Basic <br/>Windows<br/> |
| | |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

To use this connector, you must have installed the Denodo platform and configured and started its service. In case of a connection via ODBC, you must have correctly configured the connection in the ODBC Data Source Administrator.

## Capabilities Supported

* Import
* DirectQuery

## Connect to an ODBC data source from Power Query Desktop

To make the connection, take the following steps:

1. In order to connect to data, select the Get Data icon from the Home ribbon and select Denodo in the Database section.
   
   ![Denodo connector in Power Query Desktop.](./media/denodo/SelectDenodo.png)

2. There are two ways to connect to the data source of your choice: 
 
    * Via DSN (ODBC data source name)
    * Using a connection string
 
   In the **Connector Denodo** dialog in the section **DSN or Connection string**, provide the **Data source name (DSN)** or the **Connection String** depending on the type of connection preferred.

   ![Denodo connector dialog.](./media/denodo/DenodoConnector.png)   

3. The second section, **Enable debug mode**, is an optional field that allows you to add trace information to log files. These files are created by Power BI Desktop when you enable tracing in the application using the Diagnostics tab in the  Options menu. Note that the default value for Enable debug mode is false, and in this scenario, there will be no trace data in the log files from Denodo Power BI Custom Connector.

4. The last section in the **Connector Denodo** dialog is the **Data connectivity mode**, where you can choose between import mode and direct query mode.
   
5. Once you are done, select **OK**.

6. Before showing the Navigator window that displays a preview of the available data in Denodo Virtual DataPort, will request authentication data. The Denodo Power BI Custom Connector supports two authentication types: Windows and Basic.

   * **Windows**: When you decide to use Windows authentication, Power BI Desktop will connect to Virtual DataPort using Kerberos authentication. 
      ![Denodo windows authentication in Power Query Desktop](./media/denodo/DenodoWindowsAuthentication.png)
      
      You need:

      * Kerberos authentication is enabled in the Virtual DataPort server.

      * The Denodo Virtual DataPort database that the DSN connects to must be configured with the option  ODBC/ADO.net authentication type set to Kerberos.

      * The client, Power BI Desktop, has to belong to the Windows domain because the ODBC driver requests the Kerberos ticket to the ticket cache.

      * In the advanced options of the DSN configuration, consider the type of authentication you want to use:
      ![Denodo windows authentication in Power Query Desktop](./media/denodo/DenodoAdvancedOptionsDSN.png)

   * **Basic**: This authentication type allows you to connect Power BI Desktop to your Virtual DataPort data using your Virtual DataPort server credentials.
      ![Denodo basic authentication in Power Query Desktop](./media/denodo/DenodoBasicAuthentication.png)

7. Once you are done, select **Connect**.

8.  In the **Navigator** dialog, select the data you need from the database you want and choose **Load** or **Transform Data** if you are going to modify the incoming data.

   ![Denodo navigator](./media/denodo/DenodoNavigator.png)

## Connect to an ODBC data source from Power BI Service using the On-Premises Data Gateway

To make the connection, take the following steps:

1. Configure the On-premises data gateway (Enterprise gateway) that acts as a bridge, providing quick and secure data transfer between on-premises data (data in your Power BI Desktop application, not in the cloud) and the Power BI Service.
   
2. Sign in and register your gateway. In the On-premises data gateway configurator, selecting the Status tab will allow you to verify that your gateway is online and ready to be used. 

   ![On-premisesDataGateway](./media/denodo/OnPremisesDataGateway.png)

3. Using the gateway settings page, create a data source for the Denodo Power BI Custom Connector in the Power BI Service.
   
   ![Add Denodo Data source](./media/denodo/DataSourceSettinsSelectDenodo.png)

   In order to create the data source, you have to specify the way to connect to the data source of your choice: 
      * Via DSN  (see the Creating the DSN section)
      * Using a connection string (see the Creating a Denodo compatible connection string)
   
   And also you have to specify the authentication mode too. The authentication methods available:
      * Windows: When you decide to use Windows authentication, Power BI Service will connectWW to Virtual DataPort using Kerberos authentication. You need:
         * In the Data Source Settings, enter the username and password to create the Kerberos ticket.
         * Kerberos authentication is enabled in the Virtual DataPort server.
         * The Denodo Virtual DataPort database that the DSN connects to must be configured with the option  ODBC/ADO.net authentication type set to Kerberos.
         * In the advanced options of the DSN configuration, consider the type of authentication you want to use:
         ![Denodo windows authentication in Power Query Online](./media/denodo/DenodoAdvancedOptionsDSN.png)
      * Basic: This authentication type allows you to create a Data Source in Power BI Service to connect to your Virtual DataPort data using your Virtual DataPort server credentials.

4. If you use Windows authentication, you can enable (under the Advanced settings of the data source) the Single Sign-On authentication schema (SSO) in order to use the same credentials of the user accessing your reports at Power BI for accessing the required data in Denodo.
   
   ![Denodo SSO via kerberos](./media/denodo/DenodoSSO.png)
   
   There are two options for enabling SSO: Use SSO via Kerberos for DirectQuery queries and Use SSO via Kerberos for DirectQuery And Import queries. If you are working with DirectQuery based reports, both use the SSO credentials of the user that signs in to the Power BI service. The difference comes when you work with Import based reports: in this scenario, the former option uses the credentials entered in the data source page (Username and Password fields), while the latter uses the credentials of the dataset owner.

   It is important to note that there are particular prerequisites and considerations that you must take into account in order to use the Kerberos-based SSO. Some of these essential requirements are:

   Kerberos constrained delegation must be enabled for the Windows user running the Microsoft Power BI Gateway, and configuration of both the local Active Directory and Azure Active Directory environments should be performed according to the instructions offered by Microsoft for this purpose.
   By default, the Microsoft Power BI Gateway sends the user principal name (UPN) when it performs an SSO authentication operation. Therefore, you will need to review the attribute that you will use as a login identifier in Denodo Kerberos Authentication and, if it is different from userPrincipalName, adjust the Gateway settings according to this value. 

   The Microsoft Power BI Gateway configuration file called Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config,  stored at \Program Files\On-premises data gateway has two properties called ADUserNameLookupProperty and ADUserNameReplacementProperty that allow the gateway to perform local Azure AD lookups at runtime. The ADUserNameLookupProperty must specify against which attribute of the local AD it must map the user principal name that comes from Azure AD so, in this scenario, ADUserNameLookupProperty should be userPrincipalName. Then, once the user is found, the ADUserNameReplacementProperty value indicates the attribute that should be used to authenticate the impersonated user (the attribute that you will use as login identifier in Denodo).

   It should be taken into account that changes in this configuration file are at the gateway level and, therefore will affect any source with which SSO authentication is done through the Microsoft Power BI Gateway.


5. Once a data source is created for the Denodo Connector, you can refresh Power BI reports. To publish a report on powerbi.com you need to:
   * Open the report Power Query Desktop.
   * Select from the menu **File**: Publish > **Publish to Power BI**.
   * Save the report on the computer.
   * Select the workspace where you wish to publish.


