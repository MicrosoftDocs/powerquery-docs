---
title: Proxy support in the Power Query SDK
description: Describes how to use the Power Query SDK to handle proxy support for Power Query connectors.
author: ptyx507x
ms.topic: conceptual
ms.date: 1/9/2023
ms.author: miescobar
---

# Handling proxy support

This article describes how you can enable proxy support in your Power Query custom connector using the Power Query SDK.

## Windows proxy settings

First you'll need to set up the proxy settings in Windows. There are two ways to set up the proxy, either through Internet Options or the Network & internet setting.

### Internet Options

1. From the Windows start menu, search for and open **Internet Options**.
2. Select the **Connections** tab.
3. Select **LAN settings**.
4. In the **Proxy sever** section, configure the proxy server.

### Network & internet

1. From the Windows start menu, select the **Settings** icon.
2. In **Settings**, select **Network & Internet** (Windows 10), or select the **Open Navigation** icon and then select **Network & internet** (Windows 11).
3. Select **Proxy**.
4. Under the **Manual proxy setup** section, toggle the **Use a proxy server** button (Windows 10), or select the **Set up** button and toggle the **Use a proxy server** button (Windows 11).
5. Configure the address and port.

## Enabling proxy support

A `Web.DefaultProxy` function has been added to the extensibility module. Third-party M connectors can use this function to fetch the web proxy settings to be set in the driver properties (when the proxy is enabled as described in [Windows proxy settings](#windows-proxy-settings)).

The proxy information can be set in the connection string against the connection parameter, which can differ by connectors. Proxy credentials (username and password) aren't supported. `Web.DefaultProxy` takes in the serverUri/host as the parameter and returns a record containing the proxy URI as the `ProxyUri` field of a record. To get the constituent parts of the URI (for example: scheme, host, port) inside the connector, use `Uri.Parts`.

If the proxy isn't configured, `Web.DefaultProxy` returns an empty record.

## Example usage

### Example 1

To use `Web.DefaultProxy` in the connector code, a boolean type variable can be used to opt in or out of using this functionality. In this example, `Web.DefaultProxy` is invoked in the connector code if the optional boolean parameter `UseWebDefaultProxy` is set to true (defaults to false).

```powerquery-m
UseWebDefaultProxyOption = options[UseWebDefaultProxy]?,
ProxyUriRecord = if UseWebDefaultProxyOption then Web.DefaultProxy(Host) else null,
ProxyOptions = if Record.FieldCount(ProxyUriRecord) > 0 then
      [
            Proxy = ProxyUriRecord[ProxyUri]
      ]
      else [],
      ...
```

Once the `UseWebDefaultProxy` is set to true and `ProxyUriRecord` is fetched, a record can be created to set the `Proxy` (configuration parameter supported by the driver, which can vary) with the `ProxyUri` field returned by `Web.DefaultProxy`. It can be named something like `ProxyOptions`. This record can then be appended to the base `ConnectionString`, and include the proxy details along with it.

```powerquery-m
Databases = Odbc.DataSource(ConnectionString & ProxyOptions, Options)
```

### Example 2

If there are multiple configuration parameters used by the driver for setting the proxy details (like host and port details being handled separately), `Uri.Parts` can be used.

```powerquery-m
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
