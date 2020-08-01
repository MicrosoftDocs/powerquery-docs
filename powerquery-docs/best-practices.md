# Top 10 Best practices when working with Power Query

1.	Use the correct connector and navigate to the object of your choice early on
    * Doug has done an amazing job with these articles
    * Hopefully you don’t encounter this, but I see some folks using ODBC drivers instead of the native connector all the time. Especially with Postgre, MySQL and sometimes even SQL Server.
2.	Explore your data
    * Trying to promote the usage of the Data Profiling tools
    * We already have an article on this.
3.	Filter as early as you can
    * Explain a little bit about query folding and how powerful it is
    * We already got this article and I’m pretty proud of them (let’s make sure we talk about dynamic filters, e.g. “in the previous N days” and others, which come up very frequently and are not easy to discover)
4.	Use parameters to drive dynamic and flexible queries
    * Probably use a text parameter when connecting to a database for the servername or something similar
    * This is why I wanted to cover the “Parameters” article first – makes sense. I still get several pings on this blog post as it seems to cover much more than the documentation article that we currently have, particularly around the parameter binding widgets.
5.	Creating groups to stay organized
6.	Reference queries to decouple transformation phases (also cover “Extract Previous” option on Steps)
7.	Rename or add a description at a step/query/group level to further understanding your work
8.	Make sure to always have the correct data types defined (include “Detect Data Types” shortcut, and the Options to enable/disable type detection locally and globally)
9. Query resilient to changes
    * Select columns or Remove columns
10. Create reusable transformations with Custom Functions
    * Creating functions through the UI

Structure:
*	Headline: Best practice #1
*	The reason why and how
*	A link to a supporting article