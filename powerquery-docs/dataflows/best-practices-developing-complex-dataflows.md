# Best practices around designing and developing complex dataflows

If the dataflow you are developing is getting bigger and more complex, here are things you can do to design it better.

## Break into multiple dataflows

Don't do everything in one dataflow. Not only it makes the data transformation process longer, it also makes it hard to understand and re-use the dataflow. Breaking into multiple dataflows can be done because of separating entities in different dataflows, or even one entity into multiple dataflows. You can use the concept of computed entity or Linked entity to build part of the transformation in one dataflow, and re-use it in other dataflows.

## Split data transformation (T), and staging/extraction(E) dataflows

Having dataflows only for extracting data (stating dataflows), and dataflows only for transforming data is not only helpful for multi-layered architecture. It is also helpful for reducing the complexity of dataflows. Sometimes, some steps are just to extract data from the data source, such as get data, navigation, data type changes etc. With separating the staging dataflows and transformation dataflows, you make you dataflows simpler to develop.

![multi-layered dataflow architecture](media/MultiLayeredDF.png)

## Separate dataflows in multiple workspaces

Maintaining dataflows would be much easier when they are in their workspaces. It would be too confusing to have all the dataflows in one workspace. The lineage can show even dataflows from other workspaces, and the access can be given only to the users of those workspaces. 

## Use custom functions

Custom functions are very helpful in scenarios that a certain number of steps has to be done for a number of queries for different sources. Custom functions can be developed through the graphical interface in Power Query editor, or using the M script. Functions can be re-used in a dataflow in as many as entities needed.

Having a custom function helps to have only one single version of the source code, and not to duplicate the code. As a result maintaining the Power Query transformation logic and the whole dataflow will be much easier.

[This blog](https://radacad.com/custom-functions-made-easy-in-power-bi-desktop#:~:text=It%20is%20easy%20to%20consume,the%20output%20column%20as%20Holidays.) explains how to use custom functions.

![custom functions](https://i1.wp.com/radacad.com/wp-content/uploads/2016/12/2016-12-06_17h51_22.png?w=555&ssl=1)

## Place queries into folders

Using folders for queries helps to group related queries together. When developing the dataflow, spend a little more time to arrange queries in folders that makes sense. Using this approach, you can find them easier in the future and maintaining the code would be much easier.

## Use Computed Entities

Computed entity not only makes your dataflow more understandable, it also bring a better performance. When you use a computed entity, the other entities referenced from it, are getting data from an "already-processed-and-stored" entity, and the transformation would be much simpler and also faster on top of that.

## Break many steps into multiple queries

It is hard to keep track of tens of steps in one entity. The best is to break it down into multiple entities. You can use the "Enable Load" option for other queries and disable them if they are intermediate queries and only load the final entity through the dataflow. When you have multiple queries with smaller steps in each, it would be easier to use the dependency diagram and track each query for further investigation than digging into hundreds of steps in one query.

## Add properties for queries and steps

Documentation is the key to have an easy-to-maintain code. In Power Query, you can add properties to the entities, and also steps. The text that you add in the properties will show as a tooltip whenever you hover on that query or step. This would be significantly helpful in the future to maintain your model. with a glance at a table or step you can understand what is happening there, rather than re-thinking and remembering what you have done in that step.

