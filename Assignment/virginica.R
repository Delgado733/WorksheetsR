#Assignment

#1. Data(iris).

data1 <- data.frame(iris)
data1


#2. Subset the iris set into 3files per species.
data_1a <- subset(data1, Species == 'virginica' )
data_1a

#Sepal.Length
sepal <- iris$Sepal.Length[101:150]
sepal
#Sepal.Width
sepal1 <- iris$Sepal.Width[101:150]
sepal1 
#Petal.Length
petal <- iris$Petal.Length[101:150]
petal
#Petal.Width
petal1 <- iris$Petal.Width[101:150]
petal1


#3.Get the total mean for each species.
virginica_mean <- mean(colMeans(data_1a[,1:4]))
virginica_mean

#4. Get the mean of each characteristics of the species using the mean().

setosa1 <- mean(sepal)
setosa1

setosa2 <- mean(sepal1)
setosa2

setosa3 <- mean(petal)
setosa3

setosa4 <- mean(petal1)
setosa4




