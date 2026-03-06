
To connect to Azure Device Registry from Power Query Online:

1. In **Choose data source**, select Azure or search for **Azure Device Registry**, and then select **Azure Device Registry**. For more information, see [Where to get data in Power Query](../../where-to-get-data.md).
1. In **Connect to data source**, select a scope and fill in any optional or advanced fields.

   :::image type="content" source="../../media/azure-device-registry/enter-information-online.png" alt-text="Screenshot of Azure Device Registry dialog in Power Query Online." lightbox="../../media/azure-device-registry/enter-information-online.png":::

    > [!NOTE]
    > You can scope your data to either tenant or subscription level. If neither option is chosen, the connector executes at the tenant level by default.

    | Field | Description |
    | --- | --- |
    | Scope | Choose whether to retrieve data from all Azure subscriptions in your tenant or from specific subscriptions. |
    | Subscription ID(s) | Applies **only** when scope is set to Subscription. By default, all subscriptions are included. Enter one or more Subscription IDs, separated by commas, to narrow the scope to specific subscriptions.|
    | ADR Namespace(s) | Applies **only** when scope is set to Subscription. By default, the namespace filter applies across all subscriptions if no Subscription IDs are provided. Enter one or more ADR namespaces, separated by commas, to filter results.|
    | Custom Attributes | Enter a comma-separated list of up to 100 custom attribute names to include as separate columns. A column named "attributes" is always included and contains all custom attributes in JSON format, even if they aren't listed in this field. |

1. Select **Next**.
1. If you're connecting to this site for the first time, select **Sign in** and input your credentials. Then select **Connect**.
1. When you're successfully signed in, select **Next**.
1. In **Choose data**, select the resource types you require (either namespace assets (preview), devices (preview) or both) and then select **Create**.

    > [!NOTE]
    > Expect longer wait times for large query results.

