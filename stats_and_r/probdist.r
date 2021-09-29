library(gapminder)
data(gapminder)
head(gapminder)

# Create a vector x of the life expectancies of each 
# country for the year 1952. Plot a histogram of these 
# life expectancies to see the spread of the different 
# countries.
x <- subset(gapminder, year == 1952)

# What is the proportion of countries in 1952 that 
# have a life expectancy less than or equal to 40?
y <- as.numeric(x$lifeExp)
a <- 40
mean(x$lifeExp <= a)


### How to plot question 1.1 using custom function $ sapply
# Our custom function will take an input variable q, 
# and return the proportion of countries in y less than 
# or equal to q.
prop = function(q) {
  mean(y <= q)
}

prop(40)

#Now let's build a range of qs that we can 
# apply the function to:
qs = seq(from=min(y), to=max(y), length=20)

# Now we can use sapply() to apply the prop function
# to each element of qs:
props = sapply(qs, prop)

# Take a look at props, either by printing to the console, 
# or by plotting it over qs:
plot(qs, props)

# Note that we could also have written this in one line, 
# by defining the prop function inside of sapply() 
# but without naming it:
props = sapply(qs, function(q) mean(y <= q))

# This last style is called using an "inline" function or 
# an "anonymous" function. Let's compare our homemade plot
# with the pre-built one in R:
plot(ecdf(y))
