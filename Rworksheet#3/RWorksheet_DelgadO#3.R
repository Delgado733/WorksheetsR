#Worksheet-3a in R
#Worksheet for R Programming


#Using Vectors

#1. There is a built-in vector LETTERS contains the uppercase letters of the alphabet and letters which contains the lowercase letters of the alphabet.

LETTERS

letters

#Based on the above vector LETTERS:
#a. You need to produce a vector that contains the first 11 letters.

uppercase_LETTERS <- LETTERS[1:11]
uppercase_LETTERS


#b. Produce a vector that contains the odd numbered letters.

oddnumbers_LETTERS <- LETTERS[1:26 %% 2 !=0]
oddnumbers_LETTERS


#c. Produce a vector that contains the vowels


vowels_LETTERS <- LETTERS[c(1,5,9,15,21)]
vowels_LETTERS

#Based on the above vector letters:
#d. Produce a vector that contains the last 5 lowercase letters.
lowercase_letters <- letters[22:26]
lowercase_letters


#e. Produce a vector that contains letters between 15 to 24 letters in lowercase.

between_letters <- letters[15:24]
between_letters


#2. Create a vector with the average temperatures in April for Tuguegarao City, Manila,
#         Iloilo City, Tacloban, Samal Island, and Davao City. The average temperatures in
#         Celcius are 42, 39, 34, 34, 30, and 27 degrees.


# a. What is the R code and its result for creating a character vector for the city/town of
#         Tuguegarao City, Manila, Iloilo City, Tacloban, Samal Island, and Davao City? Name the
#         object as city. The names should follow the same order as in the instruction.

city <- c('Tuguegarao City', 'Manila', 'Iloilo City', 'Tacloban', 'Samal Island','Davao City')
city


#b. The average temperatures in Celcius are 42, 39, 34, 34, 30, and 27 degrees.
#       Name the object as temp. Write the R code and its output. Numbers should also follow what
#       is in the instruction.

temp <- c(42, 39, 34, 34, 30, 27)
temp


#c. Associate the temperature temp with the city by using names() function. What is
#       the R code and its result?

names(temp) <- city
temp


#e. From the answer in d, what is the content of index 5 and index 6? What is its R code?

index_5_6 <- temp[c(5,6)]
index_5_6

#Using Matrices

#2. Create a matrix of one to eight and eleven to fourteen with four columns and three rows.
#a. What will be the R code for the #2 question and its result?
col1 <- matrix(c(c(1:8, 11:14)),nrow = 3, ncol = 4)
col1

#b. Multiply the matrix by two. What is its R code and its result?

multiply_matrix <- col1*2
multiply_matrix


#c. What is the content of row 2? What is its R code?
content_row2 <- c(col1[2,1],col1[2,2],col1[2,3],col1[2,4]) 
content_row2


#d. What will be the R code if you want to display the column 3 and column 4 in row 1 and row 2? What is its output?

content_row2 <- c(col1[1,3],col1[1,4],col1[2,3],col1[2,4]) 
content_row2



#e. What is the R code is you want to display only the columns in 2 and 3, row 3? What is its output?
content_row2 <- c(col1[3,2],col1[3,3]) 
content_row2

#f. What is the R code is you want to display only the columns 4? What is its output?
content_row2 <- c(col1[1,4],col1[2,4],col1[3,4]) 
content_row2

#g. Name the rows as isa, dalawa, tatlo and columns as uno, dos, tres, quatro for the matrix that was created in b.‘. What is its R code and corresponding output?
col1 <- matrix(c(c(1:8, 11:14)),nrow = 3, ncol = 4)
col1
dimnames(col1) <- list(c("isa","dalawa","tatlo"),
                       c("uno","dos",'tres',"quatro")
)
col1

#h. From the original matrix you have created in a, reshape the matrix by assigning a
#     new dimension with dim(). New dimensions should have 2 columns and 6 rows. What will be the R code and its output?



dim(col1) <- c(6,2)
col1

#Using Arrays

#3. An array contains 1, 2, 3, 6, 7, 8, 9, 0, 3, 4, 5, 1

#a. Create an array for the above numeric values. Each values will be repeated twice
#     What will be the R code if you are to create a three-dimensional array with 4 columns and 2
#       rows. What will be its output?
x <- c(1, 2, 3, 6, 7, 8, 9, 0, 3, 4, 5, 1)
x
myarray <- array(rep(x, 2), dim = c(2,4,3))
myarray


#b. How many dimensions do your array have?
dim(myarray)
#it has 3 dimensions

#c. Name the rows as lowercase letters and columns as uppercase letters starting from
#       the A. The array names should be “1st-Dimensional Array”, “2nd-Dimentional Array”, and
#         “3rd-Dimensional Array”. What will be the R codes and its output?
dimnames(myarray) <- list(letters[1:2], LETTERS[1:4], c("1st-Dimensional Array", "2nd-Dimentional Array", "3rd-Dimensional Array"))
myarray
