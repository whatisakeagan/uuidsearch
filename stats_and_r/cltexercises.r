library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

############################################################
## If a list of numbers has a distribution that is well 
## approximated by the normal distribution, what proportion 
## of these numbers are within one standard deviation away
## from the list's average?
## Hint: Use the pnorm() function.
answer <- 68

############################################################
## What proportion of these numbers are within two 
## standard deviations away from the list's average?
95

############################################################
## What proportion of these numbers are within three 
## standard deviations away from the list's average?
99

############################################################
## Define y to be the weights of males on the control diet.
## What proportion of the mice are within one standard 
## deviation away from the average weight?
## Remember to use popsd() from rafalib for the 
## population standard deviation.
library(rafalib)
y <- filter(dat, Sex == "M") %>% select(Bodyweight, Diet)
y <- filter (y, Diet == "chow")
ymean <- mean(y$Bodyweight)
ysd <- popsd(y$Bodyweight)
ylow <- ymean - ysd
yhigh <- ymean + ysd

yprop <- (nrow(filter(y,Bodyweight <= yhigh, 
                      Bodyweight >= ylow))
          / nrow(y))

############################################################
## What proportion of these numbers are within two standard 
## deviations away from the list's average?
ylow <- ymean - 2*ysd
yhigh <- ymean + 2*ysd

yprop <- (nrow(filter(y,Bodyweight <= yhigh, 
                      Bodyweight >= ylow))
          / nrow(y))

############################################################
## What proportion of these numbers are within three 
## standard deviations away from the list's average?
ylow <- ymean - 3*ysd
yhigh <- ymean + 3*ysd

yprop <- (nrow(filter(y,Bodyweight <= yhigh, 
                      Bodyweight >= ylow))
          / nrow(y))

############################################################
## Note that the numbers for the normal distribution and 
#3 our weights are relatively close. Also, notice that we 
## are indirectly comparing quantiles of the normal 
## distribution to quantiles of the mouse weight 
## distribution. We can actually compare all quantiles 
## using a qqplot. 
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
## ^^ should have been used for above answers, FYI
qqnorm(z)
abline(0,1)

############################################################
## Here we are going to use the function replicate() to 
## learn about the distribution of random variables. 
## All the above exercises relate to the normal distribution 
## as an approximation of the distribution of a fixed list
## of numbers or a population. We have not yet discussed 
## probability in these exercises. If the distribution of 
## a list of numbers is approximately normal, then if we 
## pick a number at random from this distribution, it will 
## follow a normal distribution. However, it is important 
## to remember that stating that some quantity has a 
## distribution does not necessarily imply this quantity 
## is random. Also, keep in mind that this is not related 
## to the central limit theorem. The central limit applies 
## to averages of random variables. Let's explore this 
## concept.
## We will now take a sample of size 25 from the population 
## of males on the chow diet. The average of this sample 
## is our random variable. We will use the replicate() 
## function to observe 10,000 realizations of this random 
## variable. Set the seed at 1, then generate these 10,000 
## averages. Make a histogram and qq-plot of these 10,000 
## numbers against the normal distribution.
## We can see that, as predicted by the CLT, the 
## distribution of the random variable is very well 
## approximated by the normal distribution.
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)
## What is the average of the distribution of the sample average?
mean(avgs)

############################################################
## What is the standard deviation of the distribution of 
## sample averages (use popsd())?
popsd(avgs)
