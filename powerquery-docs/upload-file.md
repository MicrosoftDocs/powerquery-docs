---
title: "Upload a file in Power Query online"
description: "An overview on how to upload a file when using the Power Query online experience"
author: ptyx507
ms.service: powerquery
ms.reviewer: kvivek
ms.date: 12/20/2021
ms.author: dougklo
ms.custom: intro-internal
---

# Upload a file (Preview)

You can upload files to your Power Query project when using the Power Query online experience. 

## Upload a file experience

When you select a connector that offers the *Upload file* experience, you will notice a radio button on the top that enables this experience.

![Upload file option in the connection settings section of the connector settings dialog](media/upload-file/upload-file-option.png)

When you select the *Upload file* option, the option underneath will change to showcase a simple dialog to let you either drag a file or browse in your local file system to upload a file.

![Upload file experience enabled and the drag a file here to upload or browse experience shown to let the user upload a file](media/upload-file/upload-file-dialog.png)

After you've selected your file, a progress bar will show you how the upload process is going and once the upload process is finished you will be able to see a green check mark underneath your file name and with the message "Upload successful" and the file size right next to it.

![Successful upload of a file through the upload file experience that shows the icon of the file extension that was shown, the name of the file and the size of the file](media/upload-file/file-uploaded.png)

>[!NOTE]
>The files that are uploaded through this experience are stored in your personal Microsoft OneDrive for Business account.

Before you hit the next button, you need to change the authentication kind from *Anonymous* to *Organizational account* and go through the authentication process by clicking the *Sign in* button.

![Connection credentials section where the authentication kind has been set to be organizational account](media/upload-file/connection-credentials.png)

After going through the authentication process, you will be able to see a message that reads *You are currently signed in* underneath the **Authentication kind** selected. After this, you are able to click the **Next** button, which will effectively store the file in your personal Microsoft OneDrive for Business account and create a new query from the file that you've uploaded

![Connection settings page with an user authenticated using the organizational account authentication kind](media/upload-file/connection-credentials-signed-in.png)

### Drag and drop experience in the query editor

When using the Power Query editor, you are able to drop a file on either the [Diagram view](diagram-view.md) or the [queries pane](queries-pane.md) to trigger the upload a file experience.

![File being dropped in the diagram view of the query Power Query editor and showing the Upload file message](media/upload-file/drag-drop.png)

When dropping the file on either of the previously mentioned sections, a dialog with the appropriate connector settings page will be shown based on the file extension of the file that's being uploaded.

![Text / CSV connector settings page shown after dropping a text file on the diagram view of the Power Query editor](media/upload-file/drag-drop-txt.png)

## Connectors and file extensions supported

Below is a list of the connectors that provide this experience.

* [Excel](connectors/excel.md)
* [JSON](connectors/json.md)
* [PDF](connectors/pdf.md)
* [Text / CSV](connectors/textcsv.md)
* [XML](connectors/xml.md)

>[!NOTE]
> Only files with the following extensions are supported for upload: .csv, .json, .pdf, .prn, .tsv, .txt, .xl, .xls, .xlsb, .xlsm, .xlsw, .xlsx, .xml.