#Worksheet-5 in R
#Worksheet for R Programming
#-------------------------------------------------------------------------------------------------------

#   1. The table shows the enrollment of BS in Computer Science, SY 2010-2011.
# a. Plot the data using a bar graph. Write the codes and copy the result.

students <- data.frame("Course Year" = c ("1st", "2nd", "3rd", "4th"), " 2019–2020" = c(80, 75, 70, 60))
students

course <- c(80,75,70,60)
bplot <- barplot(course, ylab = , names.arg = c("1st", "2nd", "3rd","4th"))

# b. Using the same table, label the barchart with
# Title = ” Enrollment of BS Computer Science
# horizontal axis = “Curriculum Year” and
# vertical axis = “number of students”

bar2 <- barplot(course, col = rainbow(4),  
                main = " Enrollment of BS Computer Science",
                xlab = "Curriculum Year",
                ylab =  "Number of students", names.arg = c("1st", "2nd", "3rd","4th"))
bar2

# 2. The monthly income of De Jesus family was spent on the following:
#    60% on Food, 10% on electricity, 5% for savings, and
#   25% for other miscellaneous expenses.

family_spent <- c(60,10,5,25) 

#a. Create a table for the above scenario. Write the codes and its result.
month_exp <- data.frame(
  exp_names = c("Food", "Electricity", "Savings", "Miscellaneous_expenses"),
  spent = c(60, 10, 5, 25)
)
month_exp


# b. Plot the data using a pie chart. Add labels, colors and legend.
#   Write the codes and its result.

pie(family_spent, col = rainbow(4))

family_spent_labels <- round(family_spent/sum(family_spent) * 100, 10)
family_spent_labels <- paste(family_spent_labels, "%", sep = "")

pie1 <- pie(family_spent, main = "Expenses", col = rainbow(length(family_spent)), labels = family_spent_labels, cex= 0.8)

legend(1.5, 0.5, c(" Food", "Electricity","Savings","Other expenses"), cex= 0.6, bty = "n", fill = rainbow(length(family_spent)) )


# 3. Open the mtcars dataset.

View(mtcars)
# a. Create a simple histogram specifically for mpg (miles per gallon) variable.
# Use $ to select the mpg only. Write the codes and its result.

mtcarsData <- mtcars$mpg
mtcarsData

x <- hist(mtcarsData, col = "skyblue")
x


#b. Colored histogram with different number of bins.
# hist(mtcars$mpg, breaks=12, col="red")
# Note: breaks= controls the number of bins

hist(mtcarsData, breaks=5, col="red")

# c. Add a Normal Curve
#x <- mtcars$mpg
#h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon",
#        main="Histogram with Normal Curve")
#xfit<-seq(min(x),max(x),length=40)
#yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
#yfit <- yfit*diff(h$mids[1:2])*length(x)
#lines(xfit, yfit, col="blue", lwd=2)
#Copy the result.

curveData <- mtcarsData
curveData
histData <-hist(curveData, breaks=10, col="red", xlab="Miles Per Gallon",
                 main="Histogram with Normal Curve")
xfit<-seq(min(curveData),max(curveData),length=40)
yfit<-dnorm(xfit,mean=mean(curveData),sd=sd(curveData))
yfit <- yfit*diff(histData$mids[1:2])*length(curveData)
lines(xfit, yfit, col="blue", lwd=2)
histData



#4. Open the iris dataset. Create a subset for each species.
# a. Write the codes and its result.
View("iris")
data_iris <- data.frame(iris)
data_iris

data_setosa <- subset(data_iris, Species == 'setosa' )
data_setosa

data_versicolor <- subset(data_iris, Species == 'versicolor' )
data_versicolor

data_virgica <- subset(data_iris, Species == 'virginica' )
data_virgica


#b. Get the mean for every characteristics of each species using colMeans(). 
# Write the codes and its result. Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])
setosa <- colMeans(data_setosa[sapply(data_setosa,is.numeric)])
setosa

versicolor <- colMeans(data_versicolor[sapply(data_versicolor,is.numeric)])
versicolor

virginica <- colMeans(data_virgica[sapply(data_virgica,is.numeric)])
virginica


#c. Combine all species by using rbind() The table should be look like this:
  
combinedata <- rbind(setosa, versicolor,virginica)
combinedata

combineDF <- data.frame(combinedata)
combineDF

# d  From the data in 4-c: Create the barplot(). Write the codes and its result. The barplot should be like this.
barplot (as.matrix(combineDF), col = rainbow(3), main = "Iris Data",
         ylab = "Mean Scores",
         beside = T)



