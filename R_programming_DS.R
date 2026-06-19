x <- c("a", "b", "c")
as.array(x)
x <- 0:6
class(x)
as.numeric(x)
as.character(x)
m <- matrix(nrow = 2, ncol = 3)
dim(m)
attributes(m)
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#Matrices can also be created directly from vectors by adding a dimension attribute.
m <- 1:10
m
dim(m) <- c(2, 5)
m
#Matrices can be created by column-binding or row-binding 
#with the cbind() and rbind() functions.

x <- 1:3
y <-10:12
cbind(x,y)
rbind(x,y)

#Lists are a special type of vector that can contain elements of different classes.
x <- list(1, "a", TRUE, 1 + 4i)
x
#We can also create an empty list of a prespecified length with the vector() function
x <- vector("list", length = 5)
x
# Factors are used to represent categorical data and can be unordered or ordered. 
# One can think of a factor as an integer vector where each integer has a label. 
# Factors are important in statistical modeling and are treated specially by 
# modelling functions like lm() and glm().
# Using factors with labels is better than using integers because factors are self-describing. 
# Having a variable that has values “Male” and “Female” is 
# better than a variable that has values 1 and 2.
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
#The order of the levels of a factor can be set using the levels argument to factor()
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x
x <- c(1, 2, NA, 10, 3)
is.na(x)
#Data frames are used to store tabular data in R.
# Data frames are usually created by reading in a dataset using the read.table() 
# or read.csv().
# However, data frames can also be created explicitly with the data.frame()
#Data frames can be converted to a matrix by calling data.matrix()
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
row(x)
nrow(x)
x <- 1:3
names(x) <- c("Hyderabad", "Mumbai", 'Delhi')
x
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m
data = read.csv("./Python and Data Science/oil.csv")
data
a <- data.frame(x = rnorm(100), y = runif(100))
b <- c(3, 4.4, 1 / 3)
a
b
save(a, b, file = "mydata.rda")
load("mydata.rda")
con <- file("mydata.rda")
open(con, "r")
x <- readLines(con, 10)
con <- url("https://www.jhu.edu", "r")
x <- readLines(con)
head(x)
##Chapter 10 - Subsetting a Vector and Matrix
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[1:4]
x[c(1, 3, 4)]
u <- x > "a"
u
x[u]
x <- matrix(1:6, 2, 3)
x
x[1, 2]
#By default, when a single element of a matrix is retrieved, it is returned as 
# a vector of length 1 rather than a 1×1 matrix. Often, this is exactly what we want, 
# but this behavior can be turned off by setting drop = FALSE.
x[1, 2, drop = FALSE]
x[1, ]
x[1, , drop = FALSE]
x <- list(foo = 1:4, bar = 0.6)
x
#The [[ operator can be used to extract single elements from a list.
x[[1]]
x[["bar"]]
x$bar
#The $ operator can only be used with literal names.
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]
x$foo
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
## Get the 3rd element of the 1st element
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2, 1)]]
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]
x$foo
x$baz
x <- list(aardvark = 1:5)
#Note that x[c(1, 3)] is NOT the same as x[[c(1, 3)]].
x$a
x[["a"]]
x[["a", exact = FALSE]]
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
print(bad)
x[!bad]
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]
head(airquality)
good <- complete.cases(airquality)
head(airquality[good, ])
#11. Vectorized Operations
x <- 1:4
y <- 6:9
z <- x + y
z
x <- matrix(1:4, 2, 2)
x
y <- matrix(rep(10, 4), 2, 2) # repeat 10 4 times
y
x*y
## true matrix multiplication
x %*% y
#12. Dates and Times