library(dplyr)
dat <- read.csv("femaleMiceWeights.csv")

control <- filter(dat, Diet=="chow") %>%
  select(Bodyweight) %>% unlist

treatment <- filter(dat, Diet=="hf") %>%
  select(Bodyweight) %>% unlist

mean(treatment) - mean(control)

## Are the weights different by chance, or for a good reason?

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

# Gets the mean from a random sample of 12 (changes each time)
mean(sample(population, 12))
