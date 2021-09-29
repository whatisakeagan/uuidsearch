library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

# Set the seed at 1, then using a for-loop 
# take a random sample of 5 mice 1,000 times. 
# Save these averages.
set.seed(1)

n <- 1000
nulls <- vector("numeric", n)
for(i in 1:n){
  randomsample <- sample(x, 5)
  nulls[i] <- abs(mean(x) - mean(randomsample))
}
# What proportion of these 1,000 averages 
# are more than 1 gram away from the average of x ?
sum(nulls >= 1)
sum(nulls >= 1) / n


# Do the same as the above, but 10,000 times instead
set.seed(1)

n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n){
  randomsample <- sample(x, 5)
  nulls[i] <- abs(mean(x) - mean(randomsample))
}
# What proportion of these 1,000 averages 
# are more than 1 gram away from the average of x ?
sum(nulls >= 1)
sum(nulls >= 1) / n
