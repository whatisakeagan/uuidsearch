library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

## Remove lines containing missing values
dat <- na.omit(dat)
######################################################
## Use dplyr to create a vector x with the body 
## weight of all males on the control (chow) diet.
library (dplyr)
x <- filter(dat, Sex == "M") %>%
  select(Bodyweight, Diet) 
x <- filter(x, Diet == "chow")
## What is this population's average?
xavg <- mean(x$Bodyweight)

######################################################
## Now use the rafalib package and use the popsd() function 
## to compute the population (SAMPLE, ugh) standard deviation. 
library(rafalib)
popsd(x$Bodyweight)

######################################################
## Set the seed at 1. Take a random sample of size 25 from x.
set.seed(1)
randomsample <- sample(x$Bodyweight, 25)
## What is the sample average?
Xavg <- mean(randomsample)


######################################################
## Use dplyr to create a vector y with the body weight 
## of all males on the high fat hf) diet.
y <- filter(dat, Sex == "M") %>%
  select(Bodyweight, Diet) 
y <- filter(y, Diet == "hf")
## What is this population's average?
yavg <- mean(y$Bodyweight)

######################################################
## Now use the rafalib package and use the popsd() function 
## to compute the population (SAMPLE GOD) standard deviation.
popsd(y$Bodyweight)

######################################################
## Set the seed at 1. Take a random sample of size 25 from y.
set.seed(1)
randomsample2 <- sample(y$Bodyweight, 25)
## What is the sample average?
Yavg <- mean(randomsample2)

######################################################
## What is the difference in absolute value between
## yavg - xavg and Yavg - Xavg?
abs((yavg - xavg) - (Yavg - Xavg))

######################################################
## Repeat the above for females, this time setting 
## the seed to 2.
x <- filter(dat, Sex == "F") %>%
  select(Bodyweight, Diet) 
x <- filter(x, Diet == "chow")
xavg <- mean(x$Bodyweight)
set.seed(2)
randomsample <- sample(x$Bodyweight, 25)
Xavg <- mean(randomsample)
y <- filter(dat, Sex == "F") %>%
  select(Bodyweight, Diet) 
y <- filter(y, Diet == "hf")
yavg <- mean(y$Bodyweight)
set.seed(2)
randomsample2 <- sample(y$Bodyweight, 25)
Yavg <- mean(randomsample2)
## What is the difference in absolute value between
## yavg - xavg and Yavg - Xavg?
abs((yavg - xavg) - (Yavg - Xavg))
