---
title: "Parse text as JSON or XML"
description: An article on how to parse or interpret a text string into JSON or XML. 
author: ptyx507
ms.date: 12/12/2022
ms.author: miescobar
---
# Parse text as JSON or XML

In Power Query, you can parse the contents of a column with text strings by identifying the contents as either a JSON or XML text string.

You can perform this parse operation by selecting the **Parse** button found inside the following places in the Power Query Editor:

* **Transform tab**&mdash;This button will transform the existing column by parsing its contents.

    :::image type="content" source="media/parse-jason-xml/transform-tab.png" alt-text="Parse button inside the Transform tab.":::

* **Add column tab**&mdash;This button will add a new column to the table parsing the contents of the selected column.

    :::image type="content" source="media/parse-jason-xml/add-column-tab.png" alt-text="Parse button inside the Add column tab.":::

For this article, you'll be using the following sample table that contains the following columns that you need to parse:

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

The sample table looks as follows.

:::image type="content" source="media/parse-jason-xml/sample-table.png" alt-text="Sample source table.":::

The goal is to parse the above mentioned columns and expand the contents of those columns to get this output.

:::image type="content" source="media/parse-jason-xml/sample-output-final-table.png" alt-text="Sample final output table.":::

## As JSON

Select the **SalesPerson** column. Then select **JSON** from the **Parse** dropdown menu inside the **Transform** tab. These steps will transform the **SalesPerson** column from having text strings to having **Record** values, as shown in the next image. You can select anywhere in the whitespace inside the cell of the **Record** value to get a detailed preview of the record contents at the bottom of the screen.

:::image type="content" source="media/parse-jason-xml/parsed-json.png" alt-text="Parse JSON text string.":::

Select the expand icon next to the **SalesPerson** column header. From the expand columns menu, select only the **FirstName** and **LastName** fields, as shown in the following image.

:::image type="content" source="media/parse-jason-xml/parsed-json-expand-menu.png" alt-text="Parsed JSON text string fields to expand.":::

The result of that operation will give you the following table.

:::image type="content" source="media/parse-jason-xml/parsed-json-expanded-fields.png" alt-text="Expanded JSON fields.":::

## As XML

Select the **Country** column. Then select the **XML** button from the **Parse** dropdown menu inside the **Transform** tab. These steps will transform the **Country** column from having text strings to having **Table** values as shown in the next image. You can select anywhere in the whitespace inside the cell of the **Table** value to get a detailed preview of the contents of the table at the bottom of the screen.

:::image type="content" source="media/parse-jason-xml/parsed-xml.png" alt-text="Parse XML text string.":::

Select the expand icon next to the **Country** column header. From the expand columns menu, select only the **Country** and **Division** fields, as shown in the following image.

:::image type="content" source="media/parse-jason-xml/parsed-xml-expand-menu.png" alt-text="Parsed XML text string fields to expand.":::

You can define all the new columns as text columns. The result of that operation will give you the output table that you're looking for.

:::image type="content" source="media/parse-jason-xml/sample-output-final-table.png" alt-text="Sample final output table.":::
