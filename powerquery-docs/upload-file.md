---
title: "Upload a file in Power Query Online"
description: "An overview on how to upload a file when using the Power Query Online experience"
author: ptyx507
ms.date: 11/10/2025
ms.author: miescobar
ms.custom: intro-internal
ms.subservice: get-data
---

# Upload a file (Preview)

You can upload files to your Power Query project when using Power Query Online.

The following connectors currently support the upload a file feature.

* [Excel](connectors/excel.md)
* [JSON](connectors/json.md)
* [PDF](connectors/pdf.md)
* [Text / CSV](connectors/text-csv.md)
* [XML](connectors/xml.md)

> [!NOTE]
> Only files with the following extensions are supported for upload: .csv, .json, .pdf, .prn, .tsv, .txt, .xl, .xls, .xlsb, .xlsm, .xlsw, .xlsx, .xml.

## Upload a file experience

When you select a connector that offers the *Upload file* experience, a radio button appears on the top of the **Connection settings** that enables this feature.

:::image type="content" source="media/upload-file/upload-file-option.png" alt-text="Screenshot of the Upload file option in the connection settings section of the connect to a data source dialog.":::

When you select **Upload file**, the option underneath opens a simple dialog to let you either drag a file or browse in your local file system to upload a file.

:::image type="content" source="media/upload-file/upload-file-dialog.png" alt-text="Screenshot of the Upload file enabled, with the drag a file here to upload or browse experience that lets the user upload a file.":::

After you select your file, a progress bar shows you how the upload process is going. Once the upload process is finished, a green check mark displays underneath your file name, with the message **Upload successful** and the file size right next to it.

:::image type="content" source="media/upload-file/file-uploaded.png" alt-text="Screenshot of a successful upload of a file through the upload file feature, showing the icon of the file extension, the name of the file, and the size of the file.":::

> [!NOTE]
>The files uploaded through this feature are stored in your personal Microsoft OneDrive for work or school account.

Before you select the next button, you need to change the authentication kind from **Anonymous** to **Organizational account** and go through the authentication process. Start this process by selecting **Sign in**.

:::image type="content" source="media/upload-file/connection-credentials.png" alt-text="Screenshot of the connection credentials section, where the authentication kind is set to organizational account.":::

After you go through the authentication process, a **You are currently signed in** message underneath the **Authentication Kind** selection lets you know that you successfully signed in. After you signed in, select **Next**. The file is then stored in your personal Microsoft OneDrive for work or school account, and a new query is created from the file that you uploaded.

:::image type="content" source="media/upload-file/connection-credentials-signed-in.png" alt-text="Screenshot of the Connect to data source page with a user authenticated using the organizational account authentication kind.":::

### Drag and drop experience in the query editor

When using the Power Query editor, you can drop a file on either the [diagram view](diagram-view.md) or the [queries pane](queries-pane.md) to upload a file.

:::image type="content" source="media/upload-file/drag-drop.png" alt-text="Screenshot of a file being dropped in the diagram view of the Power Query editor, along with the Upload file message." lightbox="media/upload-file/drag-drop.png":::

When you drop the file on either of the previously mentioned sections, a dialog with the appropriate connector settings page is shown, based on the file extension of the file being uploaded.

:::image type="content" source="media/upload-file/drag-drop-txt.png" alt-text="Screenshot of the Text / CSV connector settings page shown after you drop a text file on the diagram view of the Power Query editor.":::
