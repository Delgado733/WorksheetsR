#Worksheet-7a in R
#R Statistics
#Worksheet for R Programming
#=====================================================================================================

#Basic Statistics
#1. Create a data frame for the table below.
students <- c(1:10) 
Pre_test <- c(55,54,47,57,51,61,57,54,63,58)
post_test <- c(61,60,56,63,56,63,59,56,62,61)
data_frame <- data.frame(
  students , 
  Pre_test ,
  post_test )
data_frame
colnames(data_frame) <- c("Students", "Pre-test","Post-test")

#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).

#Write the codes and its result.
install.packages("pastecs")
library(Hmisc)
library(pastecs)

describe(data_frame)

stat.desc(data_frame)


#2. The Department of Agriculture was studying the effects of several levels of a
#`fertilizer on the growth of a plant. For some analyses, it might be useful to convert
# the fertilizer levels to an ordered factor.

Dept_agriculture <- c(10,10,10, 20,20,50,10,20,10,50,20,50,20,10)
#a. Write the codes and describe the result.

sorted1 <- sort(Dept_agriculture, decreasing = FALSE)
sorted1
# The data show in ordered from lowest to highest

#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
# the exercise levels undertaken by 10 subjects were “l”, “n”, “n”, “i”, “l” ,
# “l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense
# n=none, l=light, i=intense
n <- c("l", "n", "n", "i", "l" ,
       "l", "n", "n", "i", "l" )
#a. What is the best way to represent this in R? answer- Data Frame

subs <- data.frame(n)
subs 
#4. Sample of 30 tax accountants from all the states and territories of Australia and
# their individual state of origin is specified by a character vector of state mnemonics
# as:
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
           "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
           "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
           "vic", "vic", "act")
# a. Apply the factor function and factor level. Describe the results.
fl <- factor(state)
fl
#5. From #4 - continuation:
#• Suppose we have the incomes of the same tax accountants in another vector
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)


#a. Calculate the sample mean income for each state we can now use the special
#function tapply():
apply1 <- tapply(state,incomes, mean)
apply1
#6. Calculate the standard errors of the state income means (refer again to number 3)

stdError <- function(x) sqrt(var(x)/length(x))
stdError(n)
incster <- tapply(incomes, state, stdError)

#a. What is the standard error? Write the codes.
#  answer: NA

#b. Interpret the result.
#the result is unavailable.The standard error cannot be determined.

#7. Use the titanic dataset.
data("Titanic")
head<- data.frame(Titanic)

#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.
titanic1 <- subset(head, select = "Survived")
titanic1

#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically
# as Dr. Wolberg reports his clinical cases. The database therefore reflects this
# chronological grouping of the data. You can create this dataset in Microsoft Excel.

#The dataset is all about Breast Cancer.

#b. Import the data from MS Excel. Copy the codes.
install.packages("readxl")
library(readxl)

data <- read_excel("/cloud/project/Rworksheet7a/Breast_Cancer.xlsx")

data


#c. Compute the descriptive statistics using different packages. Find the values of:
#c.1 Standard error of the mean for clump thickness.
clump1 <- length(data$`CL. thickness`)
clump2 <- sd(data$`CL. thickness`)
clump3 <- clump1/sqrt(data$`CL. thickness`)
clump3

#c.2 Coefficient of variability for Marginal Adhesion.
marginal_adhension <- sd(data$`Marg. Adhesion`) / mean(data$`Marg. Adhesion`)* 100
marginal_adhension

#c.3 Number of null values of Bare Nuclei.
Bare_Nuclei <- subset(data,`Bare. Nuclei` == "NA")
Bare_Nuclei

#c.4 Mean and standard deviation for Bland Chromatin
mean(data$`Bl. Cromatin`)
sd(data$`Bl. Cromatin`)

#c.5 Confidence interval of the mean for Uniformity of Cell Shape
cell_shape <- mean(data$`Cell Shape`)
cell_shape

#Calculate the mean
calmean <- mean(data$`Cell Shape`)
calmean

#Calculate the standard error of the mean

se1 <- length(data$`Cell Shape`)
se2 <- sd(data$`Cell Shape`)
se3 <- se2/sqrt(se1)
se3


#Find the t-score that corresponds to the confidence level

tscore = 0.05
tse = se1 - 1
cl = qt(p = tscore/ 2, df = tse,lower.tail = F)
cl

#Constructing the confidence interval

ci <- cl * se3

#Lower

lower <- calmean - ci


#Upper

upp <- calmean + ci


#d. How many attributes?

attributes(data)


#e. Find the percentage of respondents who are malignant. Interpret the results.
#There 18 respondents who are malignant
#There are total of 49 respondents.

percentage <- subset(data, Class == "malignant")
percentage

#9. Export the data abalone to the Microsoft excel file. Copy the codes.

install.packages("AppliedPredictiveModeling")
library("AppliedPredictiveModeling")
data("abalone")
View(abalone)
head(abalone)
summary(abalone)

#Exporting the data abalone to the Microsoft excel file
install.packages("xlsxjars")
install.packages("xlsx")
library(xlsx)
write.xlsx(abalone, "abalone.xlsx")
load("abalone.xlsx")
