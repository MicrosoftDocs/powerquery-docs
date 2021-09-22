# MicroStrategy for Power BI

>[!Note]
>The following connector article is provided by MicroStrategy, the owner of this connector and a member of the Microsoft Power Query Connector Certification Program. If you have questions regarding the content of this article or have changes you would like to see made to this article, visit the MicroStrategy website and use the support channels there.

## Summary

| Item | Description |
| ---- | ----------- |
| Release State | General Availability |
| Products | Power BI (Datasets) |
| Authentication Types Supported | Basic</br>OAuth 2.0 |
| | |

## Prerequisites

Your organization must have configured MicroStrategy environement and the user account on MicroStrategy environement needs access to the Powewr BI connector.
 
## Capabilities Supported
* Import 

## Connect to MicroStrategy using Power BI Desktop

To connect to MicroStrategy using Power BI Desktop:

1. In Power BI Desktop, select **Home** > **Get Data**. 

2. Select **Other** from the categories on the left, select **MicroStrategy for Power BI**, and then select **Connect**.

3. If this is the first time you're connecting to the MicroStrategy for Power BI connector, a third-party notice will be displayed. Select **Don't warn me again with this connector** if you don't want this message to be displayed again, and then select **Continue**.

4. Enter valid MicroStrategy Library url (ex. **https://.../MicroStrategyLibrary**)
[!Note] If you wish to utilize OIDC authentication, you have to add **#OIDCMode** string at the end of the url.</br>OIDC authentication is available from version 2.4.5 of the connector.

5. (optional) Select authentication mode, this only affects the basic authentication

6. (optional) Fill out advanced options, as neccessary

7. Click on **OK* button

8. In the window that appears, select authentication mode you want to use.

   1. Standard/LDAP

      1. Provide **user** and **password**

      2. Click **Connect**
   
   2. Library/OIDC

      [!IMPORTANT] To utilize OIDC authentication you need to add **https://oauth.powerbi.com/views/oauthredirect.html** url to list of reply urls

      1. Click **Sign in**

      2. Popup should open with the external login site (either MicroStrategyLibrary or OIDC provider)

      3. Follow steps required to authenticate with the choosen method

      4. The popup should close

      5. Click **Connect**

   9. Choose report or cube that you want to import to Power BI by navigating trought the **Navigation Table**

## Refresh data for the MicroStrategy using Power BI Online

[!WARNING] Scheduled refresh is currently supported only for OIDC authentication

To refresh data for the MicroStrategy from Power BI Online, take the following steps:
 
1. Publish dataset imported with Power BI Desktop using **MicroStrategy for Power BI** connector

2. Open **Settings** page for the published dataset

3. If this is the first time you're connecting to this database, select the authentication kind and input your credentials.

4. If necessary, select the name of your on-premises data gateway.

Now follow steps required to setup the scheduled refresh/refresh in Power BI Online.
