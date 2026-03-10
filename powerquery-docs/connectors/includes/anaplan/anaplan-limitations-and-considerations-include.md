---
title: Include file for the Limitations and considerations section of the Power Query Anaplan connector documentation
description: Include file for the Limitations and considerations section of the Power Query Anaplan connector documentation
ms.reviewer: whhender
ms.date: 03/10/2026
ms.topic: include
---

You might get error messages. Here are some common scenarios and steps for resolution.

If you do get an error message, select the refresh icon. This refresh resolves the error in most cases.

### Credential error in the Navigator

`We couldn't authenticate with the credentials provided, please try again.`

To resolve such an error:

1. Select **Refresh** (top right).

   :::image type="content" source="./media/anaplan/auth-cred-error.png" lightbox="./media/anaplan/auth-cred-error.png" alt-text="Screenshot of an authentication error with the refresh button highlighted.":::

2. Select **File**.
3. Select **Options and settings**.
4. Select **Data source settings**.
5. Select the permission **Anaplan Connector** from the list.
6. Select **Clear Permissions**.
7. Select **Delete**.

These steps remove expired Anaplan API tokens. You must reauthenticate to proceed.

### Credential error in the Power Query editor

You might experience a credential error in the [Power Query editor](../power-query-ui.md) when you reopen a Power BI report or when you edit a prior data set.

To resolve this error, select either **Close & Apply** or **Refresh Preview**.

:::image type="content" source="./media/anaplan/power-query-error.png" lightbox="./media/anaplan/power-query-error.png" alt-text="Screenshot of the Power Query error dialog.":::

Your data then refreshes.

### Integration list display error

Solution: If you don't see your complete list of integrations after you switch your **Workspace**, you can:

* Select the refresh button next to **Integrations**.
* Refresh your browser.

You can also:

1. Select **Recent sources**.

   :::image type="content" source="./media/anaplan/recent-sources.png" alt-text="Screenshot of the Recent resources option and the dropdown list of most recent sources.":::

2. Select **More**.

3. Right-click on the connection.

4. Select **Remove from list**.

   :::image type="content" source="./media/anaplan/remove-from-list.png" alt-text="Screenshot of recent source menu with Remove from list emphasized.":::

5. Connect to the export again. Your data then refreshes.

   :::image type="content" source="./media/anaplan/power-query-solution.png" alt-text="Screenshot with the Close & Apply and Refresh Preview icons emphasized." lightbox="./media/anaplan/power-query-solution.png":::

### Power Query expression error

`Expression.Error: The key didn't match any rows in the table.`

Select **Refresh Preview**.

:::image type="content" source="./media/anaplan/expression-error.png" lightbox="./media/anaplan/expression-error.png" alt-text="Screenshot of the Power Query error Key and Table.":::

The first [1,000 rows](https://community.powerbi.com/t5/Desktop/Limit-of-1000-value-reached/td-p/368850) of data then displays.

:::image type="content" source="./media/anaplan/refresh-preview.png" lightbox="./media/anaplan/refresh-preview.png" alt-text="Screenshot of the Refresh preview.":::

For more information, go to [Power Query M expression functions](/powerquery-m/expression-functions).

### Large file download error

If you go beyond the 5 gigabytes (GB) size limit, you get the following error.

`Anaplan connector supports file downloads up to 5 GB in size.`

:::image type="content" source="./media/anaplan/file-too-large.png" lightbox="./media/anaplan/file-too-large.png" alt-text="Screenshot of the Error message when a file is too large.":::

Return to your Anaplan model, decrease the size of your file, and try again.
