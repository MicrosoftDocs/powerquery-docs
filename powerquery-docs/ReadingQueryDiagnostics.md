## Introduction

Once you've [recorded](RecordingQueryDiagnostics.md) the diagnostics you want to use, the next step is being able to understand what they say.

It's helpful to have a good understanding of what exactly each column in the query diagnostics schema means, which we're not going to repeat in this short tutorial. There's a full writeup of that [here](QueryDiagnostics.md).

In general, when building visualizations, it's better to use the full detailed table because regardless of how many rows it is, what you're probably looking at is some kind of depiction of how the time spent in different resources adds up, or what the native query emitted was.

As mentioned in our article on recording the diagnostics, I'm working with the OData and SQL traces for the same table (or very nearly so)--the Customers table from Northwind. In particular, I'm going to focus on common ask from our customers, as well as one of the most easy to interpret sets of traces: full refresh of the data model.

## Building the visualizations

When going through traces, there are a lot of ways you can evaluate them. In this article we're going to focus on a two visualization split--one to show the details you care about, and the other to easily look at time contributions of various factors. For the first visualization, a table is used. You can pick any fields you like, but the ones recommended for an easy, high level look at what's going on are:

* Id
* Start Time
* Query
* Step
* Data Source Query
* Exclusive Duration (%)
* Row Count
* Category
* Is User Query

For the second visualization, one choice is to use a Stacked Column Chart. In the 'Axis' parameter, you might want to use 'Id' or 'Step'. If we're looking at the Refresh, because it doesn't have anything to do with steps in the Editor itself, we probably just want to look at 'Id'. For the 'Legend' parameter you should set 'Category' or 'Operation' (depending on the granularity you want). For the 'Value', set 'Exclusive Duration' (and make sure it's not the %, so that you get the raw duration value). Finally, for the Tooltip, set 'Earliest Start Time'.

Once your visualization is built, make sure you sort by 'Earliest Start Time' ascending so you can see the order things happen in.

While your exact needs might differ, this combination of charts is a good place to start for looking at a lot of diagnostics files and for a number of purposes.

## Interpreting the visualizations

As mentioned above, there's a lot of questions you can try to answer with query diagnostics, 
