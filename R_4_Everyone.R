library(ggplot2)
library(dplyr)
library(purrr)

library(plyr)
library(magrittr)
#necessary condiion analysis
install.packages("NCA")
install.packages("plyr")
#create a dataset for necessary condition analysis

x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby",
       "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
df <- data.frame(x, y, q)
df
# Create a new column 'z' that is the sum of 'x' and 'y'
df$z <- df$x + df$y
df
# Create a new column 'w' that is the product of 'x' and 'y'
df$w <- df$x * df$y
df
theDF <- data.frame(First=x, Second=y, Sport=q)
theDF
#number of rows and columns. Of course there are functions to do this for us: 
#nrow and ncol. And in case both are wanted at the same time there is the dim function.
nrow(theDF)
ncol(theDF)
dim(theDF)
# The names of the columns can be accessed with the names function
names(theDF)
# The names can also be set with the names function
names(theDF) <- c("First", "Second", "Sports")
# The names can also be set with the colnames function
colnames(theDF) <- c("First", "Second", "Sports")
# The names can also be set with the rownames function
rownames(theDF) <- c("Row1", "Row2", "Row3", "Row4", "Row5", 
                      "Row6", "Row7", "Row8", "Row9", "Row10")
theDF
head(theDF, n =7) # first 7 rows)
tail(theDF) # last 6 rows
class(theDF) # class of the object
theDF$Sports # access the Sports column
theDF[1:3, ] # first 3 rows
theDF[, 2:3] # second and third columns
theDF[1:3, 2:3] # first 3 rows and second and third columns
# Accessing the first row
theDF[1, ] # first row
# Accessing the first column
theDF[, 1] # first column
#accessing elements [3,2] (3rd row, 2nd column)
theDF[3, 2] # third row, second column
#rows 3 and 5, column 2
theDF[c(3, 5), 2] # rows 3 and 5, second column
#rows 3 and 5, columns 2 and 3
theDF[c(3, 5), 2:3] # rows 3 and 5, second and third columns
# all of column 3
theDF[, 3] # all of column 3
# all of row 3
theDF[3, ] # all of row 3
#To access multiple columns by name, make the column argument a character vector of the names
theDF[, c("First", "Second")] # columns First and Second
# To access multiple columns by index, make the column argument a numeric vector of the indices
theDF[, c(1, 2)] # columns 1 and 2
# To access multiple rows by index, make the row argument a numeric vector of the indices
theDF[c(1, 2, 3), ] # rows 1, 2 and 3
# To access multiple rows by name, make the row argument a character vector of the names
theDF[c("Row1", "Row2", "Row3"), ] # rows Row1, Row2 and Row3
theDF[,"Sports"] # all rows where Sports 
class(theDF[,"Sports"]) # class of the Sports column
theDF["Sports"]
class(theDF[["Sports"]]) # class of the Sports column
theDF[, "Sports", drop=FALSE] # all rows where Sport, but keep the data frame structure
newFactor <-factor(c("Pennsylvania", "New York", "New Jersey",
                                           "New York", "Tennessee", "Massachusetts",
                                           "Pennsylvania", "New York"))
model.matrix(~ newFactor - 1) # create a model matrix without intercept
install.packages("rpart")
library(rpart) # load the rpart package
# Create a simple decision tree model
treeModel <- rpart(Sports ~ First + Second, data = theDF)
# Print the model
print(treeModel)
# Plot the decision tree
plot(treeModel)
text(treeModel) # add text to the plot
# Predict using the decision tree model

predictions <- predict(treeModel, newdata = theDF, type = "class")
# Print the predictions
print(predictions)
gender <- factor(c("male", "female", "male", "female"))
print(gender)
print(class(gender))
print(levels(gender))
list(1, 2, 3)
#create a single element list
# the only element is a vector that has three elements
list(c(1, 2, 3))
# create a list with two elements
# the first is a three element vector
# the second element is a five element vector
(list3 <- list(c(1, 2, 3), 3:7))
list(theDF, 1:10)
list5 <- list(theDF, 1:10, list3)
list5
names(list5) <-c("data.frame", "vector", "list")
names(list5)
# Access the first element of the list
list5[[1]] # first element of the list
list6 <- list(TheDataFrame=theDF, TheVector=1:10, TheList=list3)
names(list6) 
list6$TheDataFrame # access the TheDataFrame element
list6$TheVector # access the TheVector element
(emptyList <- vector(mode="list", length=4))
list5[["data.frame"]]
list5[[1]]$Sport
length(list5)
# Length of the list
#create a 5X2 matrix
m <- matrix(1:10, nrow=5, ncol=2)
m
B <- matrix(21:30, nrow=5)
A <- matrix(1:10, nrow=5)
C <- matrix(21:40, nrow=2)
A*B
# Element-wise multiplication of matrices A and B
A %*% t(B) # Matrix multiplication of A and B
colnames(A) <- c("Left", "Right")
rownames(A) <- c("1st", "2nd", "3rd", "4th", "5th")
theArray <- array(1:12, dim=c(2, 3, 2))
theArray
# Create a 3D array with dimensions 2x3x2
theArray[1, , ]
# Access the first slice of the array
theArray[1, , ]
theArray[1, , 1]
theArray[1, , 2] # Access the first slice of the array, second dimension
theArray[, , 1]
theUrl  <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato <-read.table(file=theUrl, header=TRUE, sep=",")
head(tomato)
# Display the first few rows of the tomato data
#unction arguments can be specified without the name of the argument 
# (positionally indicated), but specifying the arguments is good practice. 
# The second argument, header, indicates that the first row of data holds the 
# column names. The third argument, sep, gives the delimiter separating data cells. 
# Changing this to other values such as “\t” (tab delimited) or “;” (semicolon delimited) 
# enables it to read other types of files.
# stringsAsFactors. Setting this to FALSE (the default is TRUE) prevents 
#character columns from being converted to factor columns.
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby",
       "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame("First"=x, "Second"=y, "Sport"=q, stringsAsFactors = FALSE)
theDF$Sport
# Convert the 'Sport' column to a factor
theDF$Sport <- factor(theDF$Sport)
# Display the structure of the data frame
str(theDF)
library(readr)
theUrl <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato2 <-read_delim(file=theUrl, delim=',')
head(tomato2)
str(tomato2)
# Display the structure of the tomato2 data frame
summary(tomato2)
# Display a summary of the tomato2 data frame
tomato2
#The functions read_csv, read_csv2 and read_tsv are special cases for when 
#the delimiters are commas (,), semicolons (;) and tabs (\t), respectively. 
tomato3 <- read_csv(file=theUrl)
head(tomato3)
library(data.table)
tomato4 <- fread(input=theUrl, sep=",", header=TRUE)
head(tomato4)
#using binary format
save(tomato4, file="tomato4.rda")
load("tomato4.rda")
head(tomato4)
#write to a csv file
write.csv(tomato4, file="tomato4.csv", row.names=FALSE)
#write to a tab delimited file
write.table(tomato4, file="tomato4.txt", sep="\t", row.names=FALSE)
#write to a binary file
#create some objects
n <- 20
r <- 1:10
w <- data.frame(n, r)
n
r
w
#save the objects to a binary file
save(n, r, w, file="mydata.rda")
#remove the objects from the workspace
rm(n, r, w)
n
#load them back
load("mydata.rda")
n
data(diamonds, package='ggplot2')
head(diamonds)
str(diamonds)
summary(diamonds)
table(diamonds$cut)
table(diamonds$color)
table(diamonds$clarity)
mean(diamonds$price)
median(diamonds$price)
library(ggplot2)
data("diamonds")
head(diamonds)
str(diamonds)
summary(diamonds)
table(diamonds$cut)
hist(diamonds$carat, main="Carat Histogram", xlab="Carat", col="lightblue", border="black")     
plot(price ~ carat, data=diamonds)
boxplot(price ~ cut, data=diamonds, main="Price by Cut", xlab="Cut", ylab="Price", col="lightgreen")
boxplot(price ~ color, data=diamonds, main="Price by Color", xlab="Color", ylab="Price", col="lightgreen")
boxplot(price ~ clarity, data=diamonds, main="Price by Clarity", xlab="Clarity", ylab="Price", col="blue")
plot(diamonds$carat, diamonds$price)
boxplot(diamonds$carat)
boxplot(diamonds$price)
ggplot(data=diamonds) + geom_histogram(aes(x=carat))
ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth=0.1, fill="lightblue", color="black") + labs(title="Carat Histogram", x="Carat", y="Count")
ggplot(data=diamonds) + geom_density(aes(x=carat), fill="grey50") + labs(title="Carat Density", x="Carat", y="Density")
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + labs(title="Price vs Carat", x="Carat", y="Price")
# save basics of ggplot object to a variable
p <- ggplot(diamonds, aes(x=carat, y=price))
# add layers to the plot
p + geom_point() + labs(title="Price vs Carat", x="Carat", y="Price")
p + geom_point(aes(color = color), alpha=0.1) + labs(title="Price vs Carat", x="Carat", y="Price")
p + geom_point(aes(color = color), alpha=0.1) + geom_smooth(method="lm", color="black") + labs(title="Price vs Carat with Trend Line", x="Carat", y="Price")
p + geom_point(aes(color = color), alpha=0.1) + geom_smooth(method="lm", color="black") + 
  facet_wrap(~cut) + labs(title="Price vs Carat by Cut", x="Carat", y="Price")
# ggplot2 also has the ability to make faceted plots, or small multiples as Edward Tufte would say. 
# This is done using facet_wrap or facet_grid.
# facet_wrap takes the levels of one variable, cuts up the underlying data according to them, 
# makes a separate pane for each set and arranges them to fit in the plot,
# while facet_grid takes two variables and makes a grid of plots.
#facet_grid acts similarly but assigns all levels of a variable to either a row or column 
p + geom_point(aes(color = color), alpha=0.1) + geom_smooth(method="lm", color="black") + 
  facet_grid(clarity ~ cut) + labs(title="Price vs Carat by Cut and Clarity", x="Carat", y="Price")
p + geom_point(aes(color=color)) + facet_wrap(~color)
p + geom_point(aes(color=color)) + facet_grid(~color) + theme(legend.position="none")
ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)
ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot() + facet_wrap(~color)
ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin()
ggplot(economics, aes(x=date, y=pop)) + geom_line() + labs(title="US Population Over Time", x="Date", y="Population")
#A great part of ggplot2 is the ability to use themes to easily change the way plots look.
sprintf("Hello %s", "Jared")
sprintf("Hello %s, today is %s", "Jared", "Sunday")
hello.person  <- function(name) + 
  {     print(sprintf("Hello %s", name)) }
hello.person("Jared")
as.numeric(TRUE)
toCheck <- 1
if (toCheck > 0) { print("The value is positive") } else { print("The value is zero or negative") }
check.bool  <- function(x) + 
  {     if (x) { print("The value is TRUE") } else { print("The value is FALSE") } }
check.bool(TRUE)
check.bool(FALSE)
check.bool(1)
#If we have multiple cases to check, writing else if repeatedly can be cumbersome 
#and inefficient. This is where switch is most useful
use.switch  <- function(x) + 
  {     result <- switch(x, "a" = "You selected option A", "b" = "You selected option B","c" = "You selected option C",  "d" = "You selected option D", "Invalid option" ) +    
    print(result) }
use.switch("a")
#While if is like the if statement in traditional languages, ifelse is more like the if function in Excel
toTest <- c(1, 1, 0, 1, 0, 1)
ifelse(toTest == 1, "Yes", "No")
ifelse(toTest == 1, toTest*3, toTest)
theDF <- data.frame(Name=c("Alice", "Bob", "Charlie", "David", "Eva"),
                    Age=c(25, 30, 35, 40, 28),
                    Score=c(85, 90, 78, 92, 88))
theDF
theDF$Grade <- ifelse(theDF$Score >= 90, "A",
                      ifelse(theDF$Score >= 80, "B",
                             ifelse(theDF$Score >= 70, "C", "D")))
theDF
a  <- c(1, 1, 0, 1)
b  <- c(0, 1, 0, 1)
ifelse(a == 1 & b == 1, "Both True", "At least one False")
for(i in 1:10)
{ print(i^2) }
fruit  <- c("apple", "banana", "pomegranate")
fruitLength  <- rep(NA, length(fruit))
fruitLength
names(fruitLength) <- fruit
for (f in fruit) + 
  {     fruitLength[f] <- nchar(f) }
fruitLength
fruitlength2 = nchar(fruit)
names(fruitlength2) <- fruit
fruitlength2
#apply is the first member of this family that users usually learn, and it is also the most restrictive. It must be used on a matrix, meaning all of the elements must be of the same type whether they are character, numeric or logical. 
#If used on some other object, such as a data.frame, it will be converted to a matrix first.
theMatrix <- matrix(1:9, nrow=3)
theMatrix
apply(theMatrix, 1, sum) # sum of each row, 1 for row and 2 for columns
apply(theMatrix, 2, sum) # sum of each column
apply(theMatrix, 1, mean) # mean of each row
apply(theMatrix, 2, mean) # mean of each column
rowSums(theMatrix)
colSums(theMatrix)
rowMeans(theMatrix)
colMeans(theMatrix)
theMatrix[2, 1] <- NA
apply(theMatrix, 1, sum)
apply(theMatrix, 1, sum, na.rm=TRUE)
#lapply works by applying a function to each element of a list and returning the results as a list.
theList <- list(a=1:5, b=6:10, c=11:15)
theList
lapply(theList, sum)
theList <- list(A=matrix(1:9, 3), B=1:5, C=matrix(1:4, 2), D=2)
lapply(theList, sum)
#to return the result of lapply as a vector instead, use sapply.
sapply(theList, sum)
#tapply is used to apply a function over subsets of a vector. 
#The subsets are defined by one or more factors.
theNames <- c("Jared", "Deb", "Paul")
sapply(theNames, nchar)
theVector <- c(10, 20, 30, 40, 50, 60)
theFactor <- factor(c("A", "B", "A", "B", "A", "B"))
tapply(theVector, theFactor, sum)
tapply(theVector, theFactor, mean)
#mapply
firstList <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)
mapply(dim, firstList)
secondList <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)
# test element-by-element if they are identical
mapply(identical, firstList, secondList)
vnumeric <- c(1, 2, 3, 4, 5)
vchar <- c("a", "b", "c", "d", "e")
vlogical <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
dfa <-cbind(vnumeric, vchar, vlogical)
dfb <-data.frame(vnumeric, vchar, vlogical)
dfa
dfb
dfc <-as.data.frame(dfa) #makes a dataframe with 3 different data types
dfc
str(dfa)
list1 <-list(vnumeric, vchar, vlogical)
list1
list2 <-as.data.frame(list1)
list2
list3 <- list(vnumeric=vnumeric, vchar=vchar, vlogical=vlogical, list1=list1)
list3
x<- c(1:3)
y<- c(1:9)
df1 <-cbind.data.frame(x, y)
typeof(df1$x)
typeof(df1$y)
x2 <- as.factor(c(1:3))
df2 <-cbind.data.frame(x2, y)
typeof(df2$x2)
str(df2)
x3 <- as.character(c(1:3))
df4 <-cbind.data.frame(x3, y)
df4$x3 <- factor(df4$x3, levels=c("1", "2", "3"), 
                 labels = c("MacOS", "Windows", "Linux"))
df4
typeof(df4$x3)
str(df4)
levels(df4$x3)
df4$x3
x4<- c(1:3)
df5 <-cbind.data.frame(x4, y)
df5
(df5$x4 <- ordered(df5$x4, levels=c(1, 3, 2), 
                  labels = c("No", "Maybe", "Yes")))
df5
typeof(df5$x4)
str(df5)
levels(df5$x4)
# Use of Aggergate Function
data(diamonds, package='ggplot2')
head(diamonds)
aggregate(price ~ cut, data=diamonds, FUN=mean)
aggregate(price ~ cut + color, data=diamonds, FUN=mean)
aggregate(cbind(price, carat) ~ cut, data=diamonds, FUN=mean)
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)
aggregate(cbind(price, carat) ~ cut + color, diamonds, function(x) c(mean=mean(x), sd=sd(x)))
# Use of Plyr and Dplyr
# The core of plyr consists of functions such as ddply, llply and ldply. 
# All of the manipulation functions consist of five letters, with the last three 
# always being ply. The first letter indicates the type of input and the second 
# letter indicates the type of output. For instance, ddply takes in a data.frame 
# and outputs a data.frame, llply takes in a list and outputs a list and ldply 
# takes in a list and outputs a data.frame
library(plyr)
head(baseball)
# Calculate the mean of the 'ab' column grouped by 'team'
ddply(baseball, .(team), summarize, mean_ab=mean(ab, na.rm=TRUE))
# Calculate the mean of the 'ab' and 'h' columns grouped by 'team'
ddply(baseball, .(team), summarize, mean_ab=mean(ab, na.rm=TRUE), mean_h=mean(h, na.rm=TRUE))
# Calculate the mean of the 'ab' and 'h' columns grouped by 'team' and 'year'
ddply(baseball, .(team, year), summarize, mean_ab=mean(ab, na.rm=TRUE), mean_h=mean(h, na.rm=TRUE))
theList <- list(A=matrix(1:9, 3), B=1:5, C=matrix(1:4, 2), D=2)
llply(theList, sum)
ldply(theList, sum)
identical(lapply(theList, sum), llply(theList, sum))
identical(as.data.frame(sapply(theList, sum)), ldply(theList, sum))
#To get the result as a vector, laply can be used similarly to sapply.
laply(theList, sum)
sapply(theList, sum)
#To get the result as an array, aaply can be used similarly to sapply.
aaply(theList, 1, sum)
array(sapply(theList, sum))
laply(theList, sum)
#while the results are the same, laply did not include names for the vector. 
#This is because the output of laply is intended to be an array, 
#which does not have names for its elements.
# plyr has a great number of useful helper functions such as each, 
# which lets us supply multiple functions to a function like aggregate. 
# One drawback, however, is that when using each, additional arguments 
# can no longer be supplied to the functions.
aggregate(price ~ cut, diamonds, each(mean, median))
ddply(diamonds, .(cut), summarize, mean_price=mean(price), median_price=median(price))
ddply(diamonds, .(cut, color), summarize, mean_price=mean(price), median_price=median(price))
#Another great function is idata.frame, which creates a reference to a data.frame
#so that subsetting is much faster and more memory efficient.
df_ref <- idata.frame(diamonds)
head(df_ref)
str(df_ref)
summary(df_ref)
table(df_ref$cut)
mean(df_ref$price)
median(df_ref$price)
install.packages("data.table")
library(data.table)
dt <- data.table(diamonds)
head(dt)
str(dt)
summary(dt)
table(dt$cut)
mean(dt$price)
theDF <- data.frame(A=1:10,B=letters[1:10],C=LETTERS[11:20],
                    D=rep(c("One", "Two", "Three"), length.out=10))
theDF
dt <- data.table(theDF)
dt
dt[, ] # all rows and columns
dt[ , .(A, B)] # all rows, columns A and B
dt[1:5, ] # first 5 rows, all columns
dt[ , .(A, B, C)] # all rows, columns A, B and C
theDT <- data.table(A=1:10,
                    B=letters[1:10],
                    C=LETTERS[11:20],
                    D=rep(c("One", "Two", "Three"), length.out=10))
theDT
class(theDF$B)
class(theDT$B)
theDF$B
TheDT$B
tables()
diamondsDT <- data.table(diamonds)
diamondsDT[, list(price=mean(price)), by=cut]
diamondsDT[, .(price=mean(price)), by=cut]
diamondsDT[, .(mean_price=mean(price), median_price=median(price)), by=.(cut, color)]
#Chapter 12 Faster Group Manipulation with dplyr
#dplyr versus plyr
#Selecting columns is done with select, filtering rows with filter, grouping data with group_by 
#and changing or adding columns with mutate. 
#When working with both dplyr and plyr it is important to load plyr first and then dplyr, 
#because they have a number of functions with the same names, and in R, 
#functions from the last package loaded take precedence
#plyr::summarize or dplyr::summarize
#Pipeline - magrittr package. That is, rather than nesting functions within each other, 
#storing temporary steps to variables, we pipe the result of one function into another 
#using the pipe (%>%) operator
data(diamonds, package='ggplot2')
dim(head(diamonds, n=4))
diamonds %>% head(4) %>% dim
#data.table introduced the data.table object to extend data.frames, 
#dplyr brought us tbl objects which are also an extension of data.frames
class(diamonds)
head(diamonds)
diamonds
select(diamonds, carat, price)
diamonds %>% select(carat, price)
# the columns can be specified as a vector of column names as well
cols <- c("carat", "price")
select(diamonds, all_of(cols))
diamonds %>% select(all_of(cols))
diamonds %>% select(c(carat, price))
#If the column names are stored in a variable, they should be passed to the .dots argument
cols <- c("carat", "price")
diamonds %>% select(.dots=cols)
diamonds %>% select(one_of ('carat', 'price'))
theCols <- c('carat', 'price')
diamonds %>% select(one_of(theCols))
diamonds[, c('carat', 'clarity')]
select(diamonds, 1, 7)
diamonds %>% select(1, 7)
diamonds %>% select(starts_with('c'))
diamonds %>% select(ends_with('y'))
diamonds %>% select(contains('ar'))
diamonds %>% select(ends_with('e'))
diamonds %>% select(contains('l'))
diamonds %>% select(matches('c.t'))
diamonds %>% select(matches('r.+t'))
diamonds %>% select(-carat, -price)
diamonds %>% select(-c(carat, price))
diamonds %>% select(-1, -7)
diamonds %>% select(-c(1, 7))
diamonds %>% select(-one_of('carat', 'price'))
# Filter
diamonds %>% filter(cut == 'Ideal')
diamonds %>% filter(cut != 'Ideal')
diamonds %>% filter(carat > 2)
diamonds[diamonds$cut == 'Ideal', ]
diamonds %>% filter(carat >= 1 & carat <= 2)
diamonds %>% filter(cut %in% c('Ideal', 'Good'))
diamonds %>% filter(cut == 'Ideal' | cut == 'Good')
diamonds %>% filter(price >= 1000)
