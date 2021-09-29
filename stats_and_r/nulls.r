library(dplyr)
dat <- read.csv("femaleMiceWeights.csv")

control <- filter(dat, Diet=="chow") %>%
  select(Bodyweight) %>% unlist

treatment <- filter(dat, Diet=="hf") %>%
  select(Bodyweight) %>% unlist

obs <- mean(treatment) - mean(control)

population <- read.csv("femaleControlsPopulation.csv")
# Unlist turns into a numeric vector
population <- unlist(population)

control <- sample(population, 12)
treatment <- sample(population, 12)
mean(treatment) - mean(control)

n <- 10000
# Creates an empty vector of size 10000 where the 
# null values will be saved
nulls <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(control)
}

max(nulls)
hist(nulls)

## This amounts to a p-value
sum(nulls > obs)/ n

mean(abs(nulls) > obs)
