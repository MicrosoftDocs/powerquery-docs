---
title: Proxy Support in the Power Query SDK
description: SDK Proxy support for Power Query connectors
author: bezhan-msft

ms.service: powerquery
ms.topic: conceptual
ms.date: 2/2/2022
ms.author: bezhan

LocalizationGroup: reference
---

# Handling Proxy Support

This article describes how you can enable proxy support in your Power Query custom connector by using the SDK.

## Windows Proxy Settings
First you will need to set up the proxy settings in Windows. There are two ways to do this. 

### Internet Options
- Open Internet Options 
- Go to Connections tab
- Hit the LAN Settings
- Configure Proxy Server

### Network & Internet Settings
-	Go to Proxy Tab
-	Toggle the "Use a proxy server" button under the "Manual proxy setup" section
-	Configure the address and Port

## Enabling Proxy Support

A `Web.DefaultProxy()` function has been added to the extensibility module. It can be used by third-party M connectors to fetch the web proxy settings (when enabled in the **Windows Proxy Settings** section above) to be set in the driver properties. 

The proxy information can be set in the connection string against the connection parameter, which could differ by connectors. Currently, it doesn't support proxy credentials (username and password). `Web.DefaultProxy()` takes in the serverUri/host as the parameter and returns a record containing the proxy URI as the `ProxyUri` field of a record. To get the constituent parts of the URI (for example: scheme, host, port) inside the connector, `Uri.Parts()` could be used. 

If the proxy is not configured, `Web.DefaultProxy()` would return an empty record. 

### Example usage

##### Example 1
To use `Web.DefaultProxy()` in the connector code, a boolean type variable can be used to opt in/out of using this functionality. In this example, `Web.DefaultProxy()` can be invoked in the connector code if the optional boolean parameter `UseWebDefaultProxy` (defaults to false) is set to true. 

```
UseWebDefaultProxyOption = options[UseWebDefaultProxy]?,
ProxyUriRecord = if UseWebDefaultProxyOption then Web.DefaultProxy(Host) else null,
ProxyOptions = if Record.FieldCount(ProxyUriRecord) > 0 then
      [
            Proxy = ProxyUriRecord[ProxyUri]
      ]
      else [],
      ...
```

Once the `UseWebDefaultProxy` is set to true and `ProxyUriRecord` is fetched, a record could be created to set the `Proxy` (configuration parameter supported by driver, which could vary) with the `ProxyUri` field returned by `Web.DefaultProxy()`. It could be named something like ProxyOptions. This record can then be appended to the base `ConnectionString`, to include the proxy details along with it.

```
Databases = Odbc.DataSource(ConnectionString & ProxyOptions, Options)
```

##### Example 2
If there are multiple configuration parameters used by the driver for setting the proxy details (like host and port details being handled seperately), `Uri.Parts()` could be used.

```
UseWebDefaultProxyOption = options[UseWebDefaultProxy]?,
ProxyRecord = if UseWebDefaultProxyOption then Web.DefaultProxy(Host) else null,
UriRecord = if ProxyRecord <> null then Uri.Parts(ProxyRecord) else null,
ProxyOptions = if UriRecord <> null then
    [
        ProxyHost = UriRecord[Scheme] & "://" & UriRecord[Host],
        ProxyPort = UriRecord[Port]
    ]
    else [],
    ...
```


