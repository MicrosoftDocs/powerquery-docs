
1. Select the **Active Directory** option in the get data experience. Different apps have different ways of getting to the Power Query Online get data experience. For more information about how to get to the Power Query Online get data experience from your app, go to [Where to get data](../../../where-to-get-data.md).

    :::image type="content" source="../../media/active-directory/get-data-online.png" alt-text="Screenshot of the Choose data source window with Active Directory selected.":::

1. In **Connect to data source**, enter your domain, select connection credentials if you've connected before or select **Create new connection**, and select your [**on-premises data gateway**](../../../dataflows/using-dataflows-with-on-premises-data.md).

1. Only **Windows** authentication is available. Add your username in the format **domain\alias**, and add your password. Select **Next**.

    :::image type="content" source="../../media/active-directory/connection-settings.png" alt-text="Screenshot of the Connect to data source page, showing a domain added, using a new connection, a data gateway selected, and a username and password provided.":::

1. In **Navigator**, review and/or select data from your database. Then select **OK**.
    > [!NOTE]
    > The navigator doesn't load data for the configuration partition. More information: [Limitations and issues](#limitations-and-issues)

