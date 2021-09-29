##Create a numeric vector containing the numbers 2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23.
##What is the average of these numbers?
q2 <- mean(c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23))

##Use a for loop to determine the value of (summation of i^2 if i = 1:25)
q3 = 0
for (i in 1:25) {
  q3 <- q3 + sum(i^2)
}

##The cars dataset is available in base R. 
##You can type cars to see it. 
## Use the class() function to determine what type of object is cars
q4 < -class(cars)

##How many rows does the cars object have?
q5 <- nrow(cars)

##What is the name of the second column of cars
q6 <- colnames(cars)

##The simplest way to extract the columns of a matrix or data.frame is using [. 
##For example you can access the second column with cars[,2].
##What is the average distance traveled in this dataset?
q7 <- mean(cars[,2])

##Familiarize yourself with the which() function. 
##Which row of cars has a a distance of 85? 
?which
q8 <- which(cars[,2] == 85)
