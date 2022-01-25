---
title: Power Query Oracle database connector
description: Provides basic information and prerequisites for the connector, and instructions on how to connect to your Oracle database using the connector.
author: DougKlopfenstein
ms.service: powerquery
ms.topic: conceptual
ms.date: 1/21/2022
ms.author: bezhan
LocalizationGroup: reference
---

# Oracle database
 
## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets)<br/>Power BI (Dataflows)<br/>Power Apps (Dataflows)<br/>Excel<br/>Dynamics 365 Customer Insights<br/>Analysis Services |
| Authentication Types Supported | Windows (desktop/online)<br/>Database (desktop)<br/>Basic (online) |
| Function Reference Documentation | [Oracle.Database](/powerquery-m/oracle-database) |
| | |

>[!Note]
> Some capabilities may be present in one product but not others due to deployment schedules and host-specific capabilities.

## Prerequisites

Supported Oracle versions:

* Oracle Server 9 and later
* Oracle Data Access Client (ODAC) software 11.2 and later

Before you can connect to an Oracle database using Power Query, you need to install the Oracle client software v8.1.7 or greater on your computer. To install the 32-bit Oracle client software, go to [32-bit Oracle Data Access Components (ODAC) with Oracle Developer Tools for Visual Studio (12.1.0.2.4)](https://www.oracle.com/technetwork/topics/dotnet/utilsoft-086879.html). To install the 64-bit Oracle client, go to [64-bit ODAC 12c Release 4 (12.1.0.2.4) Xcopy for Windows x64](https://www.oracle.com/technetwork/database/windows/downloads/index-090165.html).

>[!Note]
>Choose a version of Oracle Data Access Client (ODAC) that's compatible with your Oracle Server. For instance, ODAC 12.x doesn't always support Oracle Server version 9. Choose the Windows installer of the Oracle Client. During the setup of the Oracle client, make sure you enable *Configure ODP.NET and/or Oracle Providers for ASP.NET* at machine-wide level by selecting the corresponding checkbox during the setup wizard. Some versions of the Oracle client wizard selects the checkbox by default, others do'nt. Make sure that checkbox is selected so that Power Query can connect to your Oracle database.

To connect to an Oracle database with the [on-premises data gateway](/data-integration/gateway/), the correct Oracle client software must be installed on the computer running the gateway. The Oracle client software you use depends on the Oracle server version, but will always match the 64-bit gateway. For more information, go to [Manage your data source - Oracle](/power-bi/connect-data/service-gateway-onprem-manage-oracle).

## Capabilities Supported

* Import
* DirectQuery
* Advanced options
  * Command timeout in minutes
  * SQL statement
  * Include relationship columns
  * Navigate using full hierarchy

## Connect to an Oracle database from Power Query Desktop

To make the connection, take the following steps:

1. Select the **Oracle database** option in the connector selection.

2. Specify the Oracle Server to connect to in **Server**. If a SID is required, specify it by using the format *ServerName/SID*, where *SID* is the unique name of the database. If the *ServerName/SID* format doesn't work, use *ServerName/ServiceName*, where *ServiceName* is the alias you use to connect.

   ![Enter Oracle database connection.](./media/oracle-database/select-database.png)

   >[!Note]
   > If you are using a local database, or autonomous database connections, you may need to place the server name in quotation marks to avoid connection errors.

3. If you're connecting from Power BI Desktop, select either the **Import** or **DirectQuery** data connectivity mode. The rest of these example steps use the Import data connectivity mode. To learn more about DirectQuery, go to [Use DirectQuery in Power BI Desktop](/power-bi/connect-data/desktop-use-directquery).

4. If this is the first time you're connecting to this Oracle database, select the authentication type you want to use, and then enter your credentials. For more information about authentication, go to [Authentication with a data source](../connectorauthentication.md).

   ![Enter your Oracle database credentials.](./media/oracle-database/sign-in.png)

5. In **Navigator**, select the data you require, then either select **Load** to load the data or **Transform Data** to transform the data.

## Connect to an Oracle database from Power Query Online

To make the connection, take the following steps:

1. Select the **Oracle database** option in the data sources selection.

2. In the **Oracle database** dialog that appears, specify the Oracle Server to connect to in **Server**. If a SID is required, specify it by using the format *ServerName/SID*, where *SID* is the unique name of the database. If the *ServerName/SID* format doesn't work, use *ServerName/ServiceName*, where *ServiceName* is the alias you use to connect.

   ![Enter Oracle database online connection.](./media/oracle-database/select-database-online.png)

3. Select the name of your on-premises data gateway.

   > [!Note]
   > You must select an on-premises data gateway for this connector, whether the Oracle database is on your local network or on a web site.

4. If this is the first time you're connecting to this Oracle database, select the type of credentials for the connection in **Authentication kind**. Choose **Basic** if you plan to use an account that's created within Oracle instead of Windows authentication.

5. Enter your credentials.

6. Select **Next** to continue.

7. In **Navigator**, select the data you require, then select **Transform data** to transform the data in Power Query Editor.

## Connect using advanced options

Power Query Desktop provides a set of advanced options that you can add to your query if needed.

![Advanced options included in the Oracle database connection dialog box.](./media/oracle-database/advanced-options-oracle.png)

The following table lists all of the advanced options you can set in Power Query Desktop.

| Advanced option | Description |
| --------------- | ----------- |
| Command timeout in minutes | If your connection lasts longer than 10 minutes (the default timeout), you can enter another value in minutes to keep the connection open longer. This option is only available in Power Query Desktop. |
| SQL statement | For information, go to [Import data from a database using native database query](../native-database-query.md). |
| Include relationship columns | If checked, includes columns that might have relationships to other tables. If this box is cleared, you won’t see those columns. |
| Navigate using full hierarchy | If checked, the navigator displays the complete hierarchy of tables in the database you're connecting to. If cleared, the navigator displays only the tables whose columns and rows contain data. |
| | |

Once you've selected the advanced options you require, select **OK** in Power Query Desktop to connect to your Oracle database.

## Connect to Oracle Autonomous Database

To connect to an Oracle Autonomous Database, you need the following things:

* An Oracle Cloud account
* An Oracle Autonomous database
* Power BI Desktop
* Power BI service account
* On-premises data gateway

### Download your client credentials

The first step in setting up a connection to the Oracle Autonomous database is to download your client credentials.

To download your client credentials:

1. In your Oracle Autonomous database details page, select **DB Connection**.

   ![DB Connection](media/oracle-database/adb-db-connection.png)

2. From the **Database Connection** page, select **Download Wallet**.

   ![Download wallet](media/oracle-database/adb-download-wallet.png)

3. Enter a password you would like to use with this wallet, confirm the password, then select **Download**.

   ![Wallet password](media/oracle-database/adb-wallet-password.png)

### Download and install the Oracle Data Access Components runtime

1. Go to the [Oracle Data Access Components Runtime Downloads](https://www.oracle.com/database/technologies/dotnet-odacdeploy-downloads.html) page.

2. Under **ODAC XCopy**, select either **64-bit Unmanaged ODP.NET 19.10** or **32-bit Unmanaged ODP.NET 19.10**, depending on whether you'll be usting the 64-bit or 32-bit version of Power BI Desktop. This example will use the 64-bit version.

3. Review and accept the Oracle license agreement, then select **Download ODP.NETUnmanaged19.10Xcopyx64.zip**.

4. You'll be asked to sign in to your Oracle account. This account might be different from your Oracle Cloud account, so be sure to enter the correct username and password.

   The Oracle ODAC Xcopy zip file is then downloaded to your Windows default download location.

5. From the default download location, extract the files from the zip file and place them in a convenient location.

6. Open a Windows command prompt (cmd.exe) in administrator mode.

7. In the command prompt, navigate to the folder where you extracted the ODAC Xcopy files.

8. Enter the following line in the command prompt (if you are using .NET Framework 4):

   `install.bat odp.net4 c:\oracle odac false`

   >[!Note]
   >Other options exist for .NET Framework 2 or MTS, whether you want to install Oracle Instant Client, and the installation location. For example, if you are connecting to multiple autonomous databases, you might want to set up a more complex folder structure to accommodate each of these databases. Go to the readme.htm file in the folder containing the extracted ODAC Xcopy files for more information about these options.

### Configure the unmanaged ODP.NET

1. In the command prompt, go to \<install-folder\>\odp.net\bin\4. In this example, the location is `c:\oracle\odp.net\bin\4`.

2. Enter the following commands:

   `OraProvCfg /action:gac /providerpath:"Oracle.DataAccess.dll"`

   `OraProvCfg /action:config /product:odp /frameworkversion:v4.0.30319 /providerpath:"Oracle.DataAccess.dll"`

   ![ODAC commands](media/oracle-database/adb-odac-config.png)

3. Search for **Environment Variables** in the Windows Start menu **Search** option, and select **Edit the system environment variables**.

4. From **System Properties**, select **Environment Variables**.

5. In **Environment Variables**, under **User variables**, select **New**.

6. In **New User Variable**, enter `TNS_ADMIN` in **Variable name**, and the location where you'll unzip your ADB wallet in **Variable value**. Then select **OK**.

7. Under **System variables**, select **Path**, and then select **Edit**.

8. Select **New** and add the \bin and \odp.net folders to the path. In this example, add:

   `c:\oracle\bin`

   `c:\oracle\odp.net`

9. Select the \bin folder, and use **Move Up** to move it to the top of the path list. This ensures that this folder path setting has precedence over other existing Oracle Homes. 

10. Select **OK**.

11. In **Environment Variables**, select **OK**.

12. In **System Properties**, select **OK**.

### Configure Oracle ADB credentials

1. On your Windows machine, go to the folder where you downloaded your Oracle ADB credentials from [Download your client credentials](#download-your-client-credentials).

2. Unzip the credentials into a folder. In this example, the credentials are extracted to c:\data\wallet\wallet_contosomart.

   ![Wallet unzipped](media/oracle-database/adb-wallet-unzipped.png)

   >[!Note]
   >The tnsnames.ora file is used to connect to Oracle autonomous databases.

3. Open the tnsnames.ora file in the wallets folder. The file contains a list of ADB net service names that you can connect to. In this example, the names are contosomart_high, contosomart_low, and contosomart_medium. Your ADB net service names will probably be named differently.

   ![Tns names](media/oracle-database/adb-tnsnames.png)

If you are connecting to multiple ADBs on the same machine with different wallets, add the MY_WALLET_DIRECTORY parameter to the end of the network service name descriptor for each wallet. For example:

_`contosomart_high` = (description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g817f1b31d0b79f_contosomart_high.adb.oraclecloud.com))(security=(ssl_server_cert_dn="CN=adwc.uscom-east-1.oraclecloud.com, OU=Oracle BMCS US, O=Oracle Corporation, L=Redwood City, ST=California, C=US")(`MY_WALLET_DIRECTORY=C:\DATA\WALLET\Wallet_contosomart`)))_

_`contosodata_low` = (description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g817f1b31d0b79f_contosomart_low.adb.oraclecloud.com))(security=(ssl_server_cert_dn="CN=adwc.uscom-east-1.oraclecloud.com, OU=Oracle BMCS US, O=Oracle Corporation, L=Redwood City, ST=California, C=US")(`MY_WALLET_DIRECTORY=C:\DATA\WALLET\Wallet_contosodata`)))_

### Configure the gateway

1. In Power BI service, select the gear icon in the upper right-hand side, then select **Manage gateways**.

   [![Manage gateways](media/oracle-database/adb-manage-gateways.png)](media/oracle-database/adb-mamage-gateways.png#lightbox)

2. In **Add Data Source**, select **Add data sources to use the gateway**.

   [![Add data source to use the gateway](media/oracle-database/adb-add-data-source.png)](media/oracle-database/adb-add-data-source.png#lightbox)

## Troubleshooting

You might come across any of several errors from Oracle when the naming syntax is either incorrect or not configured properly:

* ORA-12154: TNS: could not resolve the connect identifier specified.
* ORA-12514: TNS: listener does not currently know of service requested in connect descriptor.
* ORA-12541: TNS: no listener.
* ORA-12170: TNS: connect timeout occurred.
* ORA-12504: TNS: listener was not given the SERVICE_NAME in CONNECT_DATA.

These errors might occur if the Oracle client either isn't installed or isn't configured properly. If it's installed, verify the tnsnames.ora file is properly configured and you're using the proper net_service_name. You also need to make sure the net_service_name is the same between the machine that uses Power BI Desktop and the machine that runs the gateway. For more information, see [Prerequisites](#prerequisites).

You might also come across a compatibility issue between the Oracle server version and the Oracle Data Access Client version. Typically, you want these versions to match, as some combinations are incompatible. For instance, ODAC 12.x doesn't support Oracle Server version 9.

If you downloaded Power BI Desktop from the Microsoft Store, you might be unable to connect to Oracle databases because of an Oracle driver issue. If you come across this issue, the error message returned is: *Object reference not set.* To address the issue, do one of these steps:

* Download Power BI Desktop from the Download Center instead of Microsoft Store.

* If you want to use the version from Microsoft Store: on your local computer, copy oraons.dll from *12.X.X\client_X* to *12.X.X\client_X\bin*, where *X* represents version and directory numbers.

If you see the error message, *Object reference not set*, in the Power BI Gateway when you connect to an Oracle database, follow the instructions in [Manage your data source - Oracle](/power-bi/connect-data/service-gateway-onprem-manage-oracle).

If you're using Power BI Report Server, consult the guidance in the [Oracle Connection Type](/sql/reporting-services/report-data/oracle-connection-type-ssrs) article.

## Next steps

[Optimize Power Query when expanding table columns](../optimize-expanding-table-columns.md)