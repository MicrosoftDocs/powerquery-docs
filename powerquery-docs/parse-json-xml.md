---
title: "Parse text as JSON or XML"
description: Describes how to parse or interpret a JSON or XML string in a table and transform the information into columns. 
author: ptyx507
ms.date: 7/23/2024
ms.author: miescobar
---

# Parse text as JSON or XML

In Power Query, you can parse the contents of a column with text strings by identifying the contents as either a JSON or XML text string.

You can perform this parse operation by selecting the **Parse** option found inside the following places in the Power Query editor:

* **Transform tab**&mdash;This option transforms the existing column by parsing its contents.

    :::image type="content" source="media/parse-jason-xml/transform-tab.png" alt-text="Screenshot of the parse option inside the Transform tab." lightbox="media/parse-jason-xml/transform-tab.png":::

* **Add column tab**&mdash;This option adds a new column to the table parsing the contents of the selected column.

    :::image type="content" source="media/parse-jason-xml/add-column-tab.png" alt-text="Screenshot of the parse option inside the Add column tab.":::

For this article, you're using a sample table that contains the following columns that you need to parse:

* **SalesPerson**&mdash;Contains unparsed JSON text strings with information about the **FirstName** and **LastName** of the sales person, as in the following example.

   ```json
   {
     "id" : 249319,
     "FirstName": "Lesa",
     "LastName": "Byrd"
   }
   ```

* **Country**&mdash;Contains unparsed XML text strings with information about the **Country** and the **Division** that the account has been assigned to, as in the following example.

   ```xml
   <root>
     <id>1</id>
     <Country>USA</Country>
     <Division>BI-3316</Division>
   </root>
   ```

The sample table also contains an Account column that contains the account number and an assigned on date.

:::image type="content" source="media/parse-jason-xml/sample-table.png" alt-text="Screenshot of the sample source table with account, assigned on, sales person, and country columns." lightbox="media/parse-jason-xml/sample-table.png":::

The goal is to parse the above mentioned columns and expand the contents of those columns to get this output.

:::image type="content" source="media/parse-jason-xml/sample-output-final-table.png" alt-text="Screenshot of the final sample output table." lightbox="media/parse-jason-xml/sample-output-final-table.png":::

## As JSON

Select the **SalesPerson** column. Then select **JSON** from the **Parse** dropdown menu inside the **Transform** tab. These steps transform the **SalesPerson** column from having text strings to having **Record** values. You can select anywhere in the whitespace inside the cell of the **Record** value to get a detailed preview of the record contents at the bottom of the screen.

:::image type="content" source="media/parse-jason-xml/parsed-json.png" alt-text="Screenshot of the parse JSON text string result." lightbox="media/parse-jason-xml/parsed-json.png":::

Select the expand icon next to the **SalesPerson** column header. From the expand columns menu, select only the **FirstName** and **LastName** fields. Also ensure that **Use original column name as prefix** is selected.

:::image type="content" source="media/parse-jason-xml/parsed-json-expand-menu.png" alt-text="Screenshot of the parsed JSON text string fields to expand.":::

The result of that operation gives you the following table.

:::image type="content" source="media/parse-jason-xml/parsed-json-expanded-fields.png" alt-text="Screenshot of the expanded JSON fields, where a salesperson first name and last name columns replace the SalesPerson column." lightbox="media/parse-jason-xml/parsed-json-expanded-fields.png":::

## As XML

Select the **Country** column. Then select the **XML** button from the **Parse** dropdown menu inside the **Transform** tab. These steps transform the **Country** column from having text strings to having **Table** values. You can select anywhere in the whitespace inside the cell of the **Table** value to get a detailed preview of the contents of the table at the bottom of the screen.

:::image type="content" source="media/parse-jason-xml/parsed-xml.png" alt-text="Screeenshot of the parse XML text string result." lightbox="media/parse-jason-xml/parsed-xml.png":::

Select the expand icon next to the **Country** column header. From the expand columns menu, select only the **Country** and **Division** fields. Also ensure that **Use original column name as prefix** is selected.

:::image type="content" source="media/parse-jason-xml/parsed-xml-expand-menu.png" alt-text="Screenshot of the parsed XML text string fields to expand." lightbox="media/parse-jason-xml/parsed-xml-expand-menu.png":::

You can define all the new columns as text columns. The result of that operation gives you the output table that you're looking for.

:::image type="content" source="media/parse-jason-xml/sample-output-final-table.png" alt-text="Screenshot of the sample final output table." lightbox="media/parse-jason-xml/sample-output-final-table.png":::
