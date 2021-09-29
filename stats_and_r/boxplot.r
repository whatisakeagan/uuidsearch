## The basic syntax to create a boxplot in R is:
## boxplot(x, data, notch, varwidth, names, main)

## x is a vector or a formula
## data is the data frame.
## notch is a logical value. Set as TRUE to draw a notch.
## varwidth is a logical value. Set as true to draw width of the box proportionate to the sample size.
## names are the group labels which will be printed under each boxplot.
## main is used to give a title to the graph.

boxplot(split(InsectSprays$count, InsectSprays$spray))

boxplot (count ~ spray, data = InsectSprays)



library(dplyr)

data(nym.2002, package="UsingR")
