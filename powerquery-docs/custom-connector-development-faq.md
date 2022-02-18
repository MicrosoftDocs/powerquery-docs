### YamlMime:FAQ
metadata:
  title: Custom connector development FAQ
  description: This article contains frequently asked questions about developing Power Query custom connectors that is collected in one spot.
  author: DougKlopfenstein
  manager: leeclontz
  ms.reviewer: bezhan
  
  ms.technology:
  ms.topic: conceptual
  ms.date: 2/17/2022
  ms.author: dougklo

title: Custom connector development FAQ
summary: |
  Here are some answers to common questions that might occur while developing custom Power Query connectors.

sections:
  - name:
    questions:
      - question: |
          The custom connector I've been developing works fine in Power BI Desktop. But when I try to run it in Power BI service, I can't set credentials or configure the data source. What's wrong?
        answer: |
          There could be several reasons why you're seeing this behavior. Some common errors that might occur while running the connector on Power BI service are:

          * Failed to update data source credentials
          * An exception occurred while trying to get `OAuthProvider` from `DataSourceReference`
          * The given data source kind isn't supported

          Before you begin troubleshooting this behavior, first collect a copy of the custom connector (.pq or .mez file). If you have a .mez file, rename the file to .zip and extract the .pq file.

          To troubleshoot the custom connector:

          1. Open the custom connector file (.pq) in a text editor of your choice.

          2. Find the `TestConnection` function. The `TestConnection` function is required for scheduled refresh in the Power BI service, but isn't used in Power BI Desktop. Check the .pq file for a `TestConnection` implementation, and confirm that the parameters match the connector's data source function. More information: [Handling gateway support](HandlingGatewaySupport.md)

          3. If the connector uses OAuth, check for the `state` parameter. A common cause of service-only failures is a missing `state` parameter in the connector's `StartLogin` implementation. This parameter isn't used in Power BI Desktop, but is required in the Power BI service. The `state` parameter must be passed into the call to [Uri.BuildQueryString](/powerquery-m/uri-buildquerystring). The following example demonstrates the correct implementation of `state`.

          ```powerquery-m
          StartLogin = (resourceUrl, state, display) =>
            let
                authorizeUrl = authorize_uri & "?" & Uri.BuildQueryString([
                    response_type = "code",
                    client_id = client_id,
                    state = state,                 //correct implementation
                    redirect_uri = redirect_uri,
                    resource = resource
                ])
            in
                [
                    LoginUri = authorizeUrl,
                    CallbackUri = redirect_uri,
                    WindowHeight = 720,
                    WindowWidth = 1024,
                    Context = null
                ];
          ```

      - question: |
          When a schema or database opens in the Power Query navigator, it starts immediately fetching all of the tables under the database instead of waiting for a table to be selected. What is causing this behavior?  
        answer: |
          This might be a side effect of how you're building your navigation table. If you're creating new records with [Table.TransformRows](/powerquery-m/table-transformrows), this usage usually results in eager evaluation of the data tables. Instead, use the following code to make the table evaluation lazy.

          ```powerquery-m
          GetShares = (server_host as text) as table =>
              let
                  url =  server_host & "/shares",
                  shares = GetItems(url),
                  withData = Table.AddColumn(shares, "Data", GetSchemas(url, [name])),
                  withItemKind = Table.AddColumn(withData, "ItemKind", each "Folder"),
                  withItemName = Table.AddColumn(withItemKind, "ItemName", each "Folder"),
                  withIsLeaf = Table.AddColumn(withItemName, "IsLeaf", each false),
                  renamed = Table.RenameColumns(withIsLeaf, {{"name", "Name"}, {"key", "Key"}}),
                  navTable = Table.ToNavigationTable(renamed, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
              in
                  navTable;
          ```

          
      - question: |
          A single table can consist of multiple partitioned files. The current implementation downloads all the files before showing a preview. Is there a way to avoid downloading all the files, and only download files until there's enough rows for the preview?
        answer: |
          This is a side effect of using [Table.Combine](/powerquery-m/table-combine). An alternative pattern is to build a "table of tables" and use the [Table.ExpandTableColumn](/powerquery-m/table-expandtablecolumn) function. This pattern lazily expands partitions as needed. For example:

          ```powerquery-m
          GetFiles = (tables_url as text, table_name as text) as table =>
              let
                  // parse raw ndjson and get the list of parquet files
                  // resp format: line 1: protocol, line 2: schema, line 3..:file info
                  resp = Lines.FromBinary(SendRequest(tables_url & "/" & table_name & "/query", [
                      Headers= [#"Content-Type"="application/json"],
                      Content= Text.ToBinary("{}")
                  ]), null, null, 1252),
                  protocol = resp{0}, // TODO: Add protocol version check
                  schema = Json.Document(Json.Document(resp{1})[metaData][schemaString])[fields],
                  columnNames = List.Transform(schema, each [name]),

                  fileInfos = List.Range(resp, 2),
                  fileUrls = List.Transform(fileInfos, each Json.Document(_)[file][url]),
                  numFiles = List.Count(fileUrls),

                  toTable = Table.FromList(fileUrls, Splitter.SplitByNothing(), {"FileUrl"}),
                  processPartition = Table.AddColumn(toTable, "Data", each Parquet.Document(Binary.Buffer(ProtectSensitiveQueryParameters([FileUrl], [ManualCredentials = true])))),
                  removeFileUrl = Table.RemoveColumns(processPartition, {"FileUrl"}),
                  expanded = Table.ExpandTableColumn(removeFileUrl, "Data", columnNames)
              in
                  if numFiles = 0 then #table(columnNames, {}) else expanded;

          ProtectSensitiveQueryParameters = (url as text, options as record) =>
              let
                  uriParts = Uri.Parts(uri),
                  uriWithoutQuery = Uri.FromParts(uriParts & [Query = []]),
                  modifiedOptions = options & [
                      CredentialQuery = uriParts[Query],
                  ]
              in
                  Web.Contents(uriWithoutQuery, modifiedOptions);
          ```

      - question: |
          Is it possible to show a warning if a large table is selected, since we already have the table metadata?
        answer: |
          No, we currently don't provide a way for connectors or queries to return out of band warnings or information to the Power Query experience.

      - question: |
          Are there any licensing prerequisites required to install gateways?  
        answer: |
          There are no licensing restrictions for installing and registering a gateway. But any cloud service might have licensing restrictions on how gateways are used within that service.

      - question: |
          Are there any requirements for network bandwidth?  
        answer: |
          Check that your network connection has good throughput. Each environment is different, and throughput depends on the amount of data that is sent. To ensure a minimum level of throughput between your on-premises data source and Azure datacenters, use [Azure ExpressRoute](/azure/expressroute/expressroute-introduction). To help measure your throughput, you can use the [Azure Speed Test app](https://azurespeedtest.azurewebsites.net/).
          
      - question: |
          Where are my credentials stored?  
        answer: |
          The credentials that you enter for a data source are encrypted and stored in the gateway cloud service. The credentials are decrypted at the gateway on premises. For more information about credential encryption in Power BI, see [Power BI security whitepaper](/power-bi/guidance/whitepaper-powerbi-security).
          
      - question: |
          What is the actual Windows service called?  
        answer: |
          On your local computer, in the Services app, the service is called "On-premises data gateway service". In Task Manager, on the Services tab, the service name is "PBIEgwService". By default, the Windows service uses "NT SERVICE\PBIEgwService" as the Service SID (SSID).

      - question: |
          Can the gateway Windows service run with an Azure Active Directory (Azure AD) account?  
        answer: |
          No, the Windows service needs a valid Windows account.

      - question: |
          Are there any inbound connections to the gateway from the cloud?  
        answer: |
          No, the gateway uses outbound connections to Azure Service Bus.

      - question: |
          What if I block outbound connections? What do I need to open?  
        answer: |
          See [Enable outbound Azure connections](service-gateway-communication.md#enable-outbound-azure-connections).
          
      - question: |
          Do I need to unblock the Azure Datacenter IP list? Where do I get the list?  
        answer: |
          If you block outbound IP traffic, you might need to unblock the Azure Datacenter IP list. The gateway communicates with Azure Service Bus by using an IP address and a fully qualified domain name. The Azure Datacenter IP list is updated weekly. For more information, see [Enable outbound Azure connections](service-gateway-communication.md#enable-outbound-azure-connections).
          
      - question: |
          What is the latency for running queries from the gateway to a data source? What is the best architecture?  
        answer: |
          To avoid network latency, install the gateway as close as possible to the data source. If you can install the gateway on the actual data source, this closer location minimizes latency.
          
          Also, consider the proximity to the Azure datacenters. For example, if your service uses the West US datacenter, and you have SQL Server hosted in an Azure virtual machine, you might also want your Azure VM in the West US region. This configuration minimizes latency and avoids egress charges on the Azure VM.
          
      - question: |
          How are results sent back to the cloud?  
        answer: |
          The results are sent through Azure Service Bus. For more information, see [On-premises data gateway architecture](service-gateway-onprem-indepth.md).
          
      - question: |
          Can I place the gateway in a perimeter network (also known as DMZ, demilitarized zone, and screened subnet)?  
        answer: |
          The gateway requires connectivity to the data source. So, if the data source isn't reachable in your perimeter network, the gateway might not have access.
          
          For example, assume your SQL Server computer isn't in your perimeter network. Also, assume you can't connect to that computer from the perimeter network. If you place the gateway in your perimeter network, the gateway can't reach the SQL Server computer.
          
      - question: |
          If the server on which the gateway is installed is only using an IPv6 address and connects with a data source (for example, Azure SQL/File Server/Database on Azure VM) using an IPv6 address only, is it possible to communicate from Power BI service to those data sources through the gateway? 
        answer: |
          Yes.

      - question: |
          If the server on which the gateway is installed is using dual stack to be assigned both IPv4 and IPv6 addresses, would IPv4 or IPv6 be the priority for gateway communication?
        answer: |
          This depends on Windows or the relevant data source drivers. This behavior is configurable in both Windows and various drivers, but isn't under the gateway’s control.

      - question: |
          Does the gateway support cross-tenant Azure AD access?
        answer: |
          No, cross-tenant Azure AD access isn't supported. A Power BI dataset in a tenant can't connect to data sources from a different tenant using an Azure AD account. This limitation applies whether the data source uses an on-premises data gateway or not. To overcome this limitation, use an authentication type other than OAuth.

      - question: |
          Can I force the gateway to use HTTPS traffic with Azure Service Bus instead of TCP?  
        answer: |
          Yes, for more information, see [Force HTTPS communication with Azure Service Bus](service-gateway-communication.md#force-https-communication-with-azure-service-bus). Turning on this feature has little effect on performance.
          
      - question: |
          Are the on-premises data gateway and Data Management Gateway, which is used by Azure Machine Learning Studio and Azure Data Factory, the same thing?  
        answer: |
          No, they are different products. To get more information about Data Management Gateway, which is now called Self-hosted Integration Runtime, see [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime).
          
      - question: |
          Can the person who sets up the gateway in the Azure portal be different from the one who installs that gateway?  
        answer: |
          Yes, you must use PowerShell to add other owners to the same gateway. These users can create the gateway in the Azure portal. However, they should connect to the portal and the gateway by using the same tenant.

      - question: |
          Does Azure ExpressRoute eliminate the need for a gateway?  
        answer: |
          No. A gateway is still required when connecting to on-premises data sources.

  - name: High availability and disaster recovery
    questions:
      - question: |
          Are there any plans for enabling high-availability scenarios with the gateway?  
        answer: |
          To help avoid a single point of failure, you can [set up on-premises data gateways as clusters](service-gateway-high-availability-clusters.md) for high availability. By default, cloud services such as Power Apps and Power BI use the primary gateway and fall back to the secondary gateway if the primary is unavailable.
          
      - question: |
          What options are available for disaster recovery?  
        answer: |
          When you install the gateway, you supply a recovery key. You can use the key to [restore or migrate](service-gateway-migrate.md) a gateway.
          
      - question: |
          What is the benefit of the recovery key?  
        answer: |
          The key provides a way to add a new gateway to a cluster or to migrate, recover, or take over a gateway.

          ## Troubleshooting

          For more information, see [Troubleshoot the on-premises data gateway](service-gateway-tshoot.md).
          
      - question: |
          Where are the gateway logs located?  
        answer: |
          See [Troubleshooting tools](service-gateway-tshoot.md#troubleshooting-tools).
          
      - question: |
          How can I see what queries are sent to the on-premises data source?  
        answer: |
          You can enable query tracing by turning on [additional logging](service-gateway-performance.md#slow-performing-queries). The logs include the queries that are sent. Remember to turn off query tracing when you're done troubleshooting. Having query tracing enabled causes the logs to be larger.
          
          You can also look at your data source's tools for tracing queries. For example, if SQL Server and SQL Server Analysis Services are data sources, you can use SQL Server Extended Events or SQL Server Profiler to trace queries.
          
  - name: Administration
    questions:
      - question: |
          Can I have more than one admin for a gateway?  
        answer: |
          Yes, when you manage a gateway, you can go to the administrator's tab to add additional admins. You can also have security groups as admins.

      - question: |
          Does the gateway admin need to be an admin on the machine where the gateway is installed?  
        answer: |
          No, the gateway admin manages the gateway from within the service.


additionalContent: |

  ## Next steps
    * [Troubleshoot the on-premises data gateway](service-gateway-tshoot.md)
          
