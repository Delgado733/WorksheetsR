#Worksheet-6
#Worksheet for R Programming

#---------------------------------------------------------------------------------------------------

library(dplyr)
library(ggplot2)

mpg1 <- as.data.frame(mpg)
mpg1

# 1. How many columns are in mpg dataset? How about the number of rows? Show the codes and its result.
# answer - it has 11 columns and a rows of 234
mpg_data <- glimpse(mpg1)
mpg_data 

#2. Which manufacturer has the most models in this data set? Which model has the most variations? 
#   Ans: Dodge, it has 37 models.

most_model <- mpg_data %>% 
  group_by(manufacturer, model) %>% tally(sort = TRUE)
most_model



#a. Group the manufacturers and find the unique models. Copy the codes and result.

unique_model <- mpg_data %>% group_by(manufacturer,model) %>% 
  distinct(model) %>% count()
unique_model

colnames(unique_model) <- c("Manufacturer", "Model","Counts")
unique_model

#b. Graph the result by using plot() and ggplot(). Write the codes and its result.
plot(most_model)

ggplot(most_model, aes(manufacturer,model)) + geom_point()

#3. Same dataset will be used. You are going to show the relationship of the modeland the manufacturer.
#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show? The data shows the manufacturer and model in a very understanding way of using a graphics plot
ggplot(mpg1, aes(model, manufacturer)) + geom_point()

#b. For you, is it useful? If not, how could you modify the data to make it more informative?
# answer -  adding a legend to easily find the data.

#4. Using the pipe (%>%), group the model and get the number of cars per model. Show codes and its result.
cars_model <- mpg_data %>% group_by(model) %>% count()
cars_model

colnames(cars_model) <- c("Model","Counts")

#a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show codes and its result.
qplot(model,data = mpg1, 
      main = "Number of Cars per Model",
      xlab = "Model",
      ylab = "Number of Cars", geom = "bar", fill = manufacturer) + coord_flip()
#b. Use only the top 20 observations. Show code and results.
top <- cars_model[1:20,] %>% top_n(2)
top

ggplot(top,aes(x = Model, y = Counts)) + 
  geom_bar(stat = "Identity") +coord_flip()

#5. Plot the relationship between cyl - number of cylinders and displ - engine displacement using geom_point with aesthetic colour = engine 
#displacement. Title should be ???Relationship between No. of Cylinders and Engine Displacement???.
#a. Show the codes and its result.
ggplot(data = mpg_data , mapping = aes(x = displ, y = cyl, main = "Relationship 
                                    between No of Cylinders and 
                                    Engine Displacement")) + 
  geom_point(mapping=aes(colour = "engine displacement")) 

#b. How would you describe its relationship?
#ans - the scatter plot shows that the cyl is in  vertical lines(y-axis) and the displ are in  in horizontal lines(x-axis).
#to easily locate the clustered data, just one look we can figure out wheres the Engine Displacement is. By having the engine displacement name in right middle side.

#6. Get the total number of observations for drv - type of drive train (f = front-wheel drive,
#r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.).

#Plot using the geom_tile() where the number of observations for class be used as a fill for aesthetics.
#a. Show the codes and its result for the narrative in #6.
ggplot(data = mpg_data, mapping = aes(x = drv, y = class)) +
  geom_tile(aes(fill=class))


#b. Interpret the result.
#ans - by mapping a geometric tile, the geom_title was shown in a diffrent colors, 
#the drv are in the X axis while the class are in the Y axis.

#7. Discuss the difference between these codes. Its outputs for each are shown below.
#ans - the graph are almost the same 
# but the first code the colour blue ignore while in the second code the colour blue displayed. The r studio are t00 much sensitive in placing a proper code in the source code.
#first code
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))

#second code
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#8. Try to run the command ?mpg. What is the result of this command?
#ans - the result are in the help option, it shows the description for the data set of mpg.

?mpg


#a. Which variables from mpg dataset are categorical?
#answer - The manufacturer, model, trans, drv, fl, class are the categorical variables of mpg data set.


#b. Which are continuous variables?
#answer - The dsipl, year, cyl, cty, and hwy are the continous variables of mpg data set.

#c. Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon). 
#Mapped it with a continuous variable you have identified in #5-b. What is its result? Why it produced such output?
#ans - The data  graph shows the data set of hwy,cyt and displ. 

ggplot(mpg, aes(x = cty, y = hwy, colour = displ)) + geom_point()
#9. Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon) using geom_point(). Add a trend line over the existing plot 
#using geom_smooth() with se = FALSE. Default method is ???loess???.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(se = FALSE)

#10. Using the relationship of displ and hwy, add a trend line over existing 
#plot. Set these = FALSE to remove the confidence interval and method = lm to 
#check for linear modeling.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE, method = lm)

