---
title: Query Diagnostics
description: Using Query Diagnostics to diagnose what operations and data source queries are being performed
author: cpopell

ms.service: powerquery
ms.topic: conceptual
ms.date: 09/22/2019
ms.author: gepopell

LocalizationGroup: reference
---

# Query Diagnostics

Query Diagnostics is a powerful new feature that will allow you to determine what Power Query is doing during authoring time. While we will be expanding on this feature in the future, including allowing you to use it during full refreshes, at this time it allows you to understand what sort of queries you are emitting, what slowdowns you might run into during authoring refresh, and what kind of background events are happening.

Whenever you start diagnostics, Power Query will begin tracing any evaluations that you cause. The evaluation that most users think of is when you press refresh, or when you retrieve data for the first time, but there are many actions that can cause evaluations depending on the connector. For example, with the SQL connector, when you retrieve a list of values to filter, that would kick off an evaluation as well—but it doesn’t associate with a user query, and that’s represented in the diagnostics. Other system generated queries might include Navigator or “Get Data” experience. 

With this first version of the feature we present two different diagnostic views—a summarized and a detailed view. The summarized view is aimed to give you an immediate insight into where time is being spent in your query. The detailed view is much deeper, line by line, and will generally only be needed for serious diagnosing by power users.

Some capabilities, like the “Data Source Query” column, are currently available only on certain connectors. We will be working to extend the breadth of this coverage in the future.

> [!NOTE]
> Power Query may perform evaluations that you may not have directly triggered. Some of these evaluations are performed in order to retrieve metadata so we can best optimize our queries or to provide a better user experience (such as retrieving the list of distinct values within a column that are displayed in the Filter Rows experience), and others might be related to how a connector handles parallel evaluations. At the same time, if you see in your query diagnostics repeated queries that you don't believe make sense, feel free to reach out through normal support channels--your feedback is how we improve our product.

## Summarized vs Detailed View

Query diagnostics provides two views:  summarized and detailed. The summarized view “collapses” multiple related operations into a single operation. In this process, details collected by each operation are combined, and the exclusive durations are summed. No information is lost as part of this process.

The summarized view provides an overview of what occurred during an evaluation for easy high level review. If for a specific operation, further breakdown is desired, the user can look at the group id and view the corresponding operations that were grouped within the detail view.

## Explaining Multiple Evaluations

When refreshing in the Power Query Editor, there's a lot done behind the scenes to attempt to give you a fluent user experience. As an example, when you ‘Refresh Preview’ the evaluator will execute the final step of each given Query, but then in the background it will sequentially run n-1 steps, n-2, steps, etc., so that if you step back through your steps it’s already available.

To keep this performant, currently some caching happens so that it doesn’t have to rerun every part of the final query plan as it goes back through the steps. While this is useful for normal authoring, it means that you will not always get correct step comparison information due to later evaluations pulling on cached data.


## Diagnostics Schema

### Id

When analyzing the results of a recording, it’s important to filter the recording session by Id, so that columns such as Exclusive Duration % make sense. 

Id is a composite identifier. It’s comprised of two numbers—one before the dot, and one after. The first number will be the same for all evaluations that resulted from a single user action. In other words, if I press refresh twice there’ll be two different numbers leading the dot, one for each user activity taken. This will be sequential for a given diagnostics recording.

The second number represents an evaluation by the engine. This will be sequential for the lifetime of the process where the evaluation is queued. If you run multiple diagnostics recording sessions, you will see this number continue to grow across the different sessions.
To summarize, if I start recording, press evaluation once, and stop recording, I’ll have some number of Ids in my diagnostics, but since I only took one action, they’ll all be 1.1, 1.2, 1.3, etc.

The combination of the activityId and the evaluationId, separated by the dot, provides a unique identifier for an evaluation for a single recording session.

### Query

The name of the Query in the left-hand pane of the Power Query editor.

### Step

The name of the Step in the right-hand pane of the Power Query editor. Things like filter dropdowns will generally associate with the step you’re filtering on, even if you’re not refreshing the step.

### Category

The category of the operation.

### Data Source Kind

This tells you what sort of data source you’re accessing, such as SQL or Oracle.
### Operation

The actual operation being performed. This can include evaluator work, opening connections, sending queries to the data source, and many more.

### Start Time

The time that the operation started.

### End Time

The time that the operation ended.
### Exclusive Duration (%)

One slightly complicated concept that we’re introducing for diagnosis is ‘Exclusive duration’. Due to the fact that many different operations can be happening at once, with overlap between them, ‘Exclusive duration’ refers to the amount of time that specific operation was ‘exclusively’ to blame. In other words, if an operation took 20ms but 10ms of that was shared with other operations, the shared time would only be counted once.

Exclusive duration % will add up to approximately 100% within a given evaluation, as filtered by the “Id” column, not within a given diagnostic.

### Exclusive Duration

The absolute time, rather than %, of exclusive duration. The total duration of an evaluation can be calculated in one of two ways:
1.	Find the operation called “Evaluation”. The difference between End Time - Start Time will result in the total duration of an evaluation.
2.	Subtract the minimum start time of all operations within an evaluation to the maximum end time.
Note that in cases when the information collected for an evaluation does not account for the total duration, an operation called “Trace Gaps” will be generated to account for this time gap.

### Resource

The resource you’re accessing for data. The exact format of this resource will depend on the data source.

### Data Source Query

Power Query does something called ‘Folding’, which is the act of running as many parts of the query against the back-end data source as possible. In Direct Query mode (over Power Query), where enabled, only transforms that fold will run. In import mode, transforms that can’t fold will instead be run locally.

The Data Source Query column allows you to see the query or HTTP request/response sent against the back-end data source. As you author your Query in the Editor, many Data Source Queries will be emitted. Some of these are the actual final Data Source Query to render the preview, but others may be for Data Profiling, Filter dropdowns, information on joins, retrieving metadata for schemas, and any number of other small queries.

In general, you shouldn’t be concerned by the number of Data Source Queries emitted unless there are specific reasons to be concerned, and should focus instead on making sure the proper content is being retrieved. This column might also help determine if the Power Query evaluation was fully folded. 

### Additional Info

There is a lot of information retrieved by our connectors. Many of it is ragged and doesn’t fit well into a standard columnar hierarchy. This is put in a record in the additional info column. Information logged from custom connectors will also appear here.

### Row Count

The number of rows returned by a Data Source Query. Not enabled on all connectors.

### Content Length

Content length returned by HTTP Requests, as commonly defined. This isn’t enabled in all connectors, and it won’t be accurate for connectors that retrieve requests in chunks.

### Is User Query
Boolean, indicates if it is a query authored by the user, and present  in the left hand pane or if it was generated by some other user action. Other user actions can include things such as Filter selection, or using the Navigator in the Get Data experience.

### Path

Path represents the relative route of the operation when viewed as part of an interval tree for all operations within a single evaluation. At the top (root) of the tree there’s a single operation called “Evaluation” with path “0”. The start time of this evaluation corresponds to the start of this evaluation as a whole. The end time of this evaluation shows when the whole evaluation finished. This top level operation has an exclusive duration of 0, as its only purpose it to serve as the root of the tree.
Further operations branch from the root. For example, an operation may have “0/1/5” as a path. This would be understood as:

* 0: tree root
* 1: current operation’s parent
* 5: index of current operation

Operation “0/1/5”, might have a child node, in which case, the path will have the form “0/1/5/8”, with 8 representing the index of the child.

### Group ID

Combining two (or more) operations will not occur if it leads to detail loss. The grouping is designed to approximate “commands” executed during the evaluation. In the detailed view, multiple operations will share a Group Id, corresponding to the groups that are aggregated in the Summary view. 

As with most columns, the group id is only relevant within a specific evaluation, as filtered by the Id column.
