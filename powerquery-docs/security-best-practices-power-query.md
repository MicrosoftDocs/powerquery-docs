---
title: Security best practices for Power Query
description: Learn how to secure Power Query, with best practices for protecting your data, connections, and transformations.
author: whhender
ms.author: whhender
ms.service: powerquery
ms.topic: concept-article
ms.custom: horz-security
ms.date: 9/24/2025
ai-usage: ai-assisted
---

# Security best practices for Power Query

Power Query provides capabilities to extract, transform, and load data from various sources into destinations like Power BI, Excel, Dataverse, and Azure Data Lake Storage. When using Power Query, it's important to follow security best practices to protect data, configurations, and connections.

This article provides guidance on how to apply security best practices when working with Power Query, helping you safeguard against outside risks.

## Data protection

Power Query processes data from various sources, making it essential to implement proper data protection measures to prevent unauthorized access and data leakage between sources.

- **Configure privacy levels for each data source**: Set appropriate privacy levels (Private, Organizational, Public) to prevent accidental data transfer between sources with different sensitivity levels. Private data sources can't share data with other sources, ensuring sensitive information remains protected. For more information, go to [Privacy levels in Power Query](privacy-levels.md).

- **Avoid ignoring privacy levels**: Don't enable Fast Combine option ("Ignore the Privacy Levels") as it could expose sensitive or confidential data to unauthorized users. This setting might improve performance but compromises security safeguards. For more information, go to  [Setting privacy level options](privacy-levels.md#setting-the-privacy-level-options).

- **Use parameterized queries securely**: When using dynamic M query parameters, avoid string concatenation within queries and instead use M operations that fold to the source query to prevent potential injection attacks. Consider using parameter-passing mechanisms built into the source query language when available. For more information, go to [Mitigate security risks with parameters](/power-bi/connect-data/desktop-dynamic-m-query-parameters#potential-security-risk).

- **Encrypt data connections**: When connecting to data sources that support encryption, always enable secure connection options. For example, when connecting to databases, ensure "Use Encrypted Connection" is selected where available. For more information, go to [Connection settings in Power Query Online](/power-query/get-data-experience#connection-settings).

- **Validate certificate revocation status**: Ensure SSL connections include certificate revocation status checks to prevent connections to compromised servers. While it's possible to disable these checks, doing so can expose your data to security risks. For more information, go to [Certificate revocation](common-issues.md#certificate-revocation).

## Identity and access management

Securing Power Query begins with implementing robust identity and access controls to ensure only authorized users can access your data sources and transformations.

- **Use Microsoft Entra ID authentication when available**: Use Microsoft Entra ID (formerly Azure AD) for secure authentication to data sources, especially for cloud services. This protocol provides centralized identity management and supports features like conditional access and multifactor authentication. For more information, go to [Authentication in desktop apps](connector-authentication.md).

- **Implement least privilege access**: Assign only the necessary permissions to users connecting to data sources through Power Query. Avoid using administrative or high-privilege accounts for routine data connections. For more information, go to [Connections and authentication in Power Query Online](connection-authentication-pqo.md).

- **Restrict non-certified connectors**: By default, Power Query raises an error when attempting to load noncertified connectors. Maintain this setting to prevent the use of custom connectors that aren't validated for security. For more information, go to [Data extension security options](/power-bi/connect-data/desktop-connector-extensibility).

- **Require user approval for native queries**: Keep the default setting that requires user approval before running native database queries, as they could potentially execute malicious SQL statements that modify or delete database records when the user has sufficient permissions. For more information, go to [Native database queries](native-database-query.md).

- **Manage credential storage securely**: Power Query encrypts and stores credentials separately from data models, facilitating credential reuse without exposing sensitive information. Ensure that only authorized users have access to manage these stored credentials. For more information, go to [Power BI implementation planning: Content creator security planning](/power-bi/guidance/powerbi-implementation-planning-security-content-creator-planning#create-and-publish-content).

## Network security

Implementing network security controls helps protect your Power Query connections and prevents unauthorized access to your data sources.

- **Use data gateways for on-premises data sources**: Implement on-premises data gateways or virtual network data gateways to securely connect to data sources in private networks without exposing them to the public internet. For more information, go to [Connect to a Power Query data source](/dynamics365/customer-insights/data/connect-power-query).

- **Implement network isolation for sensitive data sources**: Use virtual network data gateways to connect to Azure services within a virtual network without requiring an on-premises data gateway on a virtual machine. Using a virtual network gateway provides another layer of network isolation for sensitive data. For more information, go to [Virtual network data gateways](/data-integration/vnet/overview).

- **Enable TLS encryption for all connections**: Ensure that connections to data sources use Transport Layer Security (TLS) encryption with modern cipher suites. Outdated cipher suites might not be supported and could pose security risks. For more information, go to [Power Query cipher suites](common-issues.md#power-query).

- **Configure firewalls for data source access**: When using Power Query Online with Azure Storage or other cloud services with firewall settings, ensure proper configuration to allow authenticated connections while blocking unauthorized access. For more information, go to [Azure Blob Storage limitations](connectors/azure-blob-storage.md#limitations).

## Logging and monitoring

Implementing comprehensive logging and monitoring helps detect suspicious activities and troubleshoot issues with your Power Query deployments.

- **Enable Query Diagnostics for sensitive operations**: Use Query Diagnostics in Power BI Desktop to investigate Power Query performance and understand what queries are being sent to data sources. These diagnostics ensure query folding is working correctly. However, unless you need Query Diagnostics for troubleshooting, it's best to keep these diagnostics off. These diagnostics are stored in log files and could contain customer content, such as query names, source paths, and so on. For more information, go to [Query Diagnostics](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing#query-diagnostics).

- **Use appropriate Web Preview Warning Level** - Use the appropriate Web Preview Warning Level in desktop builds of Power Query. Moderate and Strict ensure that you don't load any websites that you haven't visited before, which can protect you from loading malicious websites. The Web Preview Warning Level option in Power Query is only available from Power BI Desktop or Excel.

- **Monitor native queries sent to data sources**: To ensure queries don't contain unexpected or potentially harmful operations, regularly review the actual queries sent to your data sources. Query Diagnostics can help identify which queries are being sent. For more information, go to [Query evaluation and folding](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing#query-evaluation-and-folding).

- **Track data source connections**: Monitor which data sources are being accessed, how frequently, and by which users to identify unusual access patterns that might indicate security issues. For more information, go to [Performance monitoring](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-overview#value-of-auditing-and-monitoring).

- **Audit dataflow and datamart operations**: Track user activities for Power BI dataflows and datamarts using the Power BI activity log to maintain visibility into data transformation operations. For more information, go to [Dataflow monitoring](/power-bi/guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing#dataflow-monitoring).

## Service-specific security

Power Query includes specific security considerations related to its implementation across different Microsoft products and services.

- **Validate custom connectors**: If using custom connectors, ensure they come from trusted sources and are properly reviewed for security vulnerabilities. Prefer using certified connectors whenever possible. For more information, go to [Custom connectors](/power-bi/guidance/powerbi-implementation-planning-security-content-creator-planning#create-and-publish-content).

- **Secure R and Python scripts**: When using R or Python scripts in Power Query, be aware that they execute with the permissions of the user and could potentially access sensitive data. Only use scripts from trusted sources and set appropriate privacy levels. For more information, go to [Use R in Power Query Editor](/power-bi/connect-data/desktop-r-in-query-editor#use-an-r-script-in-power-query-editor).

## Best practices for gateways

- **Consider gateway clustering for critical workloads**: For enterprise environments with critical data processing needs, implement gateway clusters to improve reliability and meet different compliance or security requirements for various data sources. For more information, go to [Connect to on-premises resources](/power-platform/guidance/adoption/data-protection#connect-to-on-premise-resources).

## Learn more

- [Data privacy levels in Power Query](privacy-levels.md)
- [Behind the scenes of the Data Privacy Firewall](data-privacy-firewall.md)
- [Connections and authentication in Power Query Online](connection-authentication-pqo.md)
- [Handling authentication in Power Query](handling-authentication.md)
