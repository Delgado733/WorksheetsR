#Worksheet-2 in R

#Accomplish this worksheet by answering the questions being asked and
#writing the code manually.

#*Using Vectors*


#1. Create a vector using : operator
#a. Sequence from -5 to 5. Describe its output.
seq<- c(-5:5)
seq

# [1] -5 -4 -3 -2 -1  0  1  2  3  4  5

#b. x <- 1:7. What will be the value of x?
x <- 1:7
x    
#[1] 1 2 3 4 5 6 7


#2.* Create a vector using seq() function
#a. seq(1, 3, by=0.2) # specify step size
# Describe the output.
seq(1, 3, by=0.2)
#starting to 1 then adding 0.2 until reach into 3. 


#3. A factory has a census of its workers. There are 50 workers in total. The following
#list shows their ages: 34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46,
#25, 17, 37, 43, 53, 41, 51, 35, 24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26, 18.

age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
         24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
         18)
age

#a. Access 3rd element, what is the value?
thirdElement <-(age[3])
thirdElement
#[1] 22

#b. Access 2nd and 4th element, what are the values?

second_and_Fourth_element <- age[c(2,4)]
second_and_Fourth_element 
#[1] 28 36

#c. Access all but the 1st element is not included. Write the R code and its output.
all <- age[c(2:50)]
all

#4. *Create a vector x <- c("first"=3, "second"=0, "third"=9). Then named the vector, names(x).
name <- c("first"=3, "second"=0, "third"=9)
name

#a. Print the results. Then access x[c("first", "third")]. Describe the output.

name <- name[c("first", "third")]
name
#only "first" and "third" is the output

#5. Create a sequence x from -3:2.
x <- (-3:2)
x
#a. Modify 2nd element and change it to 0;
x[2] <- 0
x
#second element change to zero

#6. *The following data shows the diesel fuel purchased by Mr. Cruz.
#a. Create a data frame for month, price per liter (php) and purchase-quantity (liter).
#Write the codes.

diesel_fuel <- data.frame(
  Month = c("Price_per_liter(Php)", "Purchase_quantity(Liter"),
  Jan = c(52.50, 25),
  Feb = c(57.25, 30),
  March = c(60.00, 40),
  Apr = c(65.00, 50),
  May = c(74.25, 10),
  June = c(54.00, 45)
)
diesel_fuel

#b. What is the average fuel expenditure of Mr. Cruz from Jan to June? Note: Use
#weighted.mean(liter, purchase)

Jan = c(52.50, 25)
Feb = c(57.25, 30)
March = c(60.00, 40)
Apr = c(65.00, 50)
May = c(74.25, 10)
June = c(54.00, 45)

liters <- c(52.50, 57.25, 60.00)
weighted.mean(Jan, Feb, March, Apr, May, June)

#7. R has actually lots of built-in datasets. For example, the rivers data “gives the lengths
#(in miles) of 141 “major” rivers in North America, as compiled by the US Geological
#Survey”.

# a. Type “rivers” in your R console. Create a vector data with 7
#elements, containing the number of elements (length) in rivers,
#their sum (sum), mean (mean), median (median), variance (var)
#standard deviation (sd), minimum (min) and maximum (max).

data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data

#8. The table below gives the 25 most powerful celebrities and their annual pay as ranked
#by the editions of Forbes magazine and as listed on the Forbes.com website.
#a. Create vectors according to the above table. Write the codes.
Most_powerful <- data.frame(Power_Ranking = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25), 
                            Celebrity_Name = c("Tom cruise", "Rolling Stone", "Oprah Winfrey", "U2", "Tiger Woods", "Steven Spielberg", "Howard Stem", "50 cents", "Cast of the Supranos", "Dan brown", "Bruce Springteen", "Donald Trump","Muhammad Ali",
                                               "Paul McCartney", "Goerge Lucas", "Elton John", "David Letterman", "Phil Mickelson", "J.K Rowling", "Bradd Pitt", "Peter Jackson", "Dr. Phil McGraw", "Jay Lenon", "Celine Dion", "Kobe Bryant"),
                            Pay = c(67, 90, 225, 110 , 90, 332, 302, 41, 52, 88, 55, 44, 55, 40, 233, 34, 40, 47, 75, 25, 39, 45, 32, 40, 31 )
)
Most_powerful


installed.packages("rmarkdown")

tinytex::install_tinytex()
