XML
Release State: General Availability
Products: Power BI Desktop, Power BI Service (Enterprise Gateway - Web.Page), Dataflows in PowerBI.com (Enterprise Gateway - Web.Page), Dataflows in PowerApps.com (Enterprise Gateway - Web.Page), Excel (minus PDF)

Authentication Types Supported:

Prerequisites: None

Capabilities supported:
Document per connector

Text
CSV
XML
JSON
PDF
Web.Page
Web.Contents

XML

Both XML functions don't do a good job of surfacing data in a consistent shape. Users are going to have to do extra data shaping to get it into the sort of shape they will want to see it in.

Xml.Tables (whatever the UI uses)
If you have similarly structured entries, and you have text nodes with a title entry for each, and one of those nodes has extra tags on the title, it drops everything outside the tag. It does text or nodes, not mixed.

Xml.Document
Returns mixed content as text, including nested tags, etc.

Text
Quotestyle
In text or CSV--'do you support newlines in cells or not', unclear because it's called quotestyle

CSV
Engine function documentation

CRI - promote headers can request the file twice due to how the connector handles the stream when requesting from a web endpoint, the solution is to wrap web.contents with binary.buffer

JSON
Engine function documentation

CRIs - Shaping can be difficult. Significant amount of expanding expected. Convert to table from list, etc.

PDF
Engine function documentation
Inferred tables, representation of entire page
CRIs - There are edge cases in table inference, if you find a table being read incorrectly, please report through standard support channels.

Web connector
Point to file, file connector wrapped around web.contents or alternately if it's an html page, it's web.page.
CRIs on web.page auth types
