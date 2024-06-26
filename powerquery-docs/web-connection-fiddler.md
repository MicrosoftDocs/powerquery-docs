---
title: Capture web requests with Fiddler
description: Describes how to set up Fiddler to capture secure HTTP addresses and monitor web traffic when troubleshooting Power Query communications issues.
author: DougKlopfenstein
ms.date: 6/13/2024
ms.author: dougklo
---

# Capture web requests with Fiddler

When diagnosing issues that might occur when Power Query communicates with your data, you might be asked to supply a Fiddler trace. The information provided by Fiddler can be of significant use when troubleshooting connectivity issues.

> [!NOTE]
>This article assumes that you are already familiar with how Fiddler works in general.

## Set up Fiddler to capture secure HTTP addresses

Before you can begin capturing web requests issued by Power Query, you must first enable Fiddler to capture secure HTTP addresses (https://) on your device.

If you don't already have Fiddler installed, download and install [Fiddler](https://www.telerik.com/download/fiddler/fiddler4) now. Be sure to install Fiddler on the system where the issue is occurring.

To set up Fiddler to capture secure HTTP addresses:

1. Open Fiddler.

2. Under **File**, clear the check mark next to **Capture Traffic**.

3. Select **Tools** > **Options**.

4. Open the **HTTPS** tab.

5. Select **Capture HTTPS CONNECTs**.

6. Select **Decrypt HTTPS traffic**.

7. In the root certificate dialog, select **Yes**.

   :::image type="content" source="./media/web-connection-fiddler/fiddler-root-certificate.png" alt-text="Screenshot of the root certificate dialog where you select yes to trust the Fiddler root certificate.":::

8. When asked to confirm that you want to add the certificate to your PCs Trusted Root List, select **Yes**.

9. In the **HTTPS** tab, select **OK**.

10. In the Fiddler traffic pane, select one of the current traces, and then press **Ctrl+X**. This action clears all of the current traces from the traffic pane.

    :::image type="content" source="./media/web-connection-fiddler/clear-fiddler-pane.png" alt-text="Screenshot of the Fiddler traffic pane where you use Ctrl + X to clear all traces from the pane":::

## Guidelines for capturing web requests

Because Fiddler captures all network traffic during the recorded session, be sure to close all other apps and web pages before capturing a fiddler trace. Closing all other apps and web pages clears away most extra web traffic not associated with the issue you're trying to capture.

Once you close all other apps and web pages not associated with the issue, clear the Fiddler traffic pane as described in step 10 in the previous procedure. Then select **File** > **Capture traffic** just before starting the operation in question. After the issue occurs, immediately clear the check mark next to **File** > **Capture traffic** to stop the capture.

These actions minimize the number of messages we have to dig through, and also helps focus the investigation. It also avoids capturing other potentially sensitive information that you don't want to share.

If you're only running Power Query and Fiddler, this minimum setup should yield a sequence of HTTP requests and responses from whatever backend you're communicating with, for example Power BI service, SharePoint, or Azure. The requests, responses, headers, response codes, and sometimes the payload all provide clues we can use to troubleshoot your issue.

To save the capture session to a log file, select **File** > **Save** > **All Sessions**. You might also be asked to compress the log file (.zip) before sending it.

## Return your system to its original configuration

Once you finish providing Fiddler log files and troubleshooting is complete, you can return your system to its original configuration and remove Fiddler as the middleman.

To return your system to its original configuration:

1. In Fiddler, select **Tools** > **Options**.
2. In **Options**, open the **HTTPS** tab.
3. Clear the check mark next to **Capture HTTPS CONNECTS**.
4. Select **Actions**.
5. Select **Reset All Certificates**.

   :::image type="content" source="media/web-connection-fiddler/reset-all-certificates.png" alt-text="Screenshot showing how to reset all certificates and return your system to its original configuration.":::

6. In **Reset All Certificates**, select **OK**.
7. In **Do you want to allow this app to make changes to your device?**, select **Yes**.
8. In **TrustCert Success**, select **OK**.
9. In **Root Certificate Store**, select **Yes**.
10. If the root certificate dialog box appears, close the dialog box without selecting **Yes** or **No**.
11. In **Success**, select **OK**.
12. In **Options**, select **OK**.

## Related content

- [Query diagnostics](QueryDiagnostics.md)
- [Power Query feedback](feedback.md)
- [Getting started with Fiddler Classic](https://docs.telerik.com/fiddler/configure-fiddler/tasks/configurefiddler)
