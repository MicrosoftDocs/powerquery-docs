#XML

## Summary

Release State: General Availability
Products: Power BI Desktop, Power BI Service (Enterprise Gateway), Dataflows in PowerBI.com (Enterprise Gateway), Dataflows in PowerApps.com (Enterprise Gateway), Excel

Authentication Types Supported:


Capabilities supported:
Document per connector

## Functionality

Due to the fact that many XML documents have ragged or nested data, you will have to do extra data shaping to get it in the sort of form that will make it convenient to do analytics.
Both XML functions don't do a good job of surfacing data in a consistent shape. Users are going to have to do extra data shaping to get it into the sort of shape they will want to see it in.

Xml.Tables (whatever the UI uses)
If you have similarly structured entries, and you have text nodes with a title entry for each, and one of those nodes has extra tags on the title, it drops everything outside the tag. It does text or nodes, not mixed.

Xml.Document
Returns mixed content as text, including nested tags, etc.

Text
Quotestyle
In text or CSV--'do you support newlines in cells or not', unclear because it's called quotestyle

Web connector
Point to file, file connector wrapped around web.contents or alternately if it's an html page, it's web.page.
CRIs on web.page auth types
