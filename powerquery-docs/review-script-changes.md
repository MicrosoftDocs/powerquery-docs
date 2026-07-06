---
title: Review Script Changes in Power Query Online
description: Learn why Power Query Online changes your M script and how the Review Script Changes dialog helps. Accept modifications or rewrite queries to preserve comments.
author: ptyx507x
ms.topic: concept-article
ms.date: 07/01/2026
ms.author: miescobar
ms.subservice: user-assistance
---

# Review script changes in Power Query Online

Because of how Power Query Online stores queries, you might lose manually entered M script (usually comments) in some cases. The **Review Script Changes** pane provides a *diff* experience that highlights the changes. This feature helps you understand what changes are made. You can accept the changes or rearrange your script to fix it.

Three notable cases can cause this experience.

### Script for ribbon transforms

Ribbon transforms always generate the same M script, which might differ from the way you manually enter it. This script should always be equivalent. Contact support if it's not.

### Comments

You must place comments inside the `Let .. in` expression and above a step. The user interface shows this location as a `Step` property. All other comments are lost. Comments that you write on the same line as one step but above another step (for example, after the comma that trails every step) move down.

### Removing script errors

In certain cases, Power Query Online updates your script if it results in a syntax error by escaping your script (for example, when using the formula bar).

## Experience

When you commit a query, Power Query Online evaluates it to see if the *stored* version of the script differs from what you submitted. If it does, it presents you with a **Review script changes** dialog box that you can accept or cancel.

- If you accept, Power Query Online makes the changes to your query.
- If you cancel, you might rewrite your query to make sure that you move your comments properly, or rearrange however else you want.

:::image type="content" source="media/review-script-changes/review-script-changes.png" alt-text="Screenshot that shows the Review Script Changes pane depicting differences between what is committed and what is saved.":::
