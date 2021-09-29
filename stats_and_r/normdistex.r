library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

# Using the same process as before (in Null Distribution 
# Exercises), set the seed at 1, then using a for-loop 
# take a random sample of 5 mice 1,000 times. 
# Save these averages. After that, set the seed at 1, 
# then using a for-loop take a random sample of 50 mice 
# 1,000 times. Save these averages:
set.seed(1)
n <- 1000
averages5 <- vector("numeric", n)
for(i in 1:n){
  y <- sample(x, 5)
  averages5[i] <- mean(y)
}

set.seed(1)
n <- 1000
averages50 <- vector("numeric", n)
for(i in 1:n){
  z <- sample(x, 50)
  averages50[i] <- mean(z)
}

# For averages50, what proportion are between 23 and 25? 
mean( averages50 < 25 & averages50 > 23)


#What is the proportion of observations between 23 and 25 
#in a normal distribution with average 23.9 and 
#standard deviation 0.43?

#Hint: Use pnorm() twice.
# pnorm(x, mu, sigma) or pnorm( (x-mu)/sigma )
pnorm(25, 23.9, 0.43) - pnorm(23, 23.9, 0.43)
