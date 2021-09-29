## Make sure that you are using the correct random number 
## generator (RNG) settings by calling the following command:
RNGkind("Mersenne-Twister", "Inversion", "Rejection")

############################################################
## When we studied null distributions, you may have noticed 
## that the answers to questions 1 and 2 barely changed. 
## This is expected. The way we think about the random value 
## distributions is as the distribution of the list of values 
## obtained if we repeated the experiment an infinite number 
## of times. On a computer, we can't perform an infinite 
## number of iterations, so instead, for our examples, we 
## consider 1,000 to be large enough. Now if instead we 
## change the sample size, then we change the random variable 
## and thus its distribution.
## Reload the data set from that section:
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

## Set the seed at 1, then using a for-loop take a random 
## sample of 50 mice 1,000 times. Save these averages.
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}
## What proportion of these 1,000 averages are more than 
## 1 gram away from the average of x ?
mean( abs( averages50 - mean(x) ) > 1)


############################################################
## Reload the gapminder data
library(gapminder)
data(gapminder)
head(gapminder)
## What is the proportion of countries in 1952 that have a 
## life expectancy between 40 and 60 years?
### Hint: this is the proportion that have a life expectancy 
### less than or equal to 60 years, minus the proportion 
### that have a life expectancy less than or equal to 40 
### years.
library(dplyr)
y <- filter(gapminder, year == 1952) %>%
  select(year, lifeExp)
head(y)
bw <- filter(y, lifeExp >= 40 & lifeExp <= 60)
(nrow(bw))/(nrow(y))

############################################################
