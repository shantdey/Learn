
datasets::iris
data("iris")
?iris
head(iris)
summary(iris)
plot(iris)
# hist(iris$Sepal.Length,
#      main = "Histogram of Sepal Length",
#      xlab = "Sepal Length",
#      col = "lightblue",
#      border = "black")
hist(iris$Petal.Width,
     main = "Histogram of Petal width",
     xlab = "Petal Width",
     col = "lightgreen",
     border = "black")
#put graphs in 3 rows and 1 column
par(mfrow = c(1, 1))
# #small multiples
hist(iris$Sepal.Length,
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length",
     col = "lightblue",
     border = "black")
hist(iris$Sepal.Width [iris$Species == "setosa"],
     main = "Histogram of Sepal Width (Setosa)",
     xlab = "Sepal Width",
     col = "lightpink",
     border = "black")
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Iris Sepal Dimensions",
       x = "Sepal Length",
       y = "Sepal Width") +
  theme_minimal()
?plot
plot(iris$Species)
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Species, iris$Sepal.Length)
install.packages("dplyr")
library(dplyr)
View(mtcars)
data("mtcars")
head(mtcars)
summary(mtcars)
plot(iris$Petal.Length, iris$Petal.Width, col = iris$Species,
     xlab = "Petal Length", ylab = "Petal Width",
     main = "Iris Petal Dimensions")
plot(cos, 0, 2*pi)
plot(sin, 0, 2*pi)
plot(exp, 1, 5)
plot(log, 1, 10)
plot(dnorm, -3, 3, col = "red", lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "Z Scores", ylab = "Density")
library(datasets)
data("mtcars")
head(mtcars)
?mtcars
cylinders <- table(mtcars$cyl)
cylinders
barplot(cylinders)
plot(cylinders)
barplot(table(mtcars$cyl),
        col = "lightblue",
        main = "Number of Cars by Cylinder Count",
        xlab = "Number of Cylinders",
        ylab = "Count of Cars")
hist(mtcars$mpg,
     col = "lightgreen",
     main = "Distribution of Miles Per Gallon (mpg)",
     xlab = "Miles Per Gallon",
     ylab = "Frequency")
boxplot(mtcars$hp ~ mtcars$cyl,
        col = c("lightcoral", "lightblue", "lightgreen"),
        main = "Horsepower by Cylinder Count",
        xlab = "Number of Cylinders",
        ylab = "Horsepower")
Data_Cars <- mtcars
rownames(Data_Cars)[which.max(Data_Cars$hp)]
rownames(Data_Cars)[which.min(Data_Cars$hp)]
mean_hp <- mean(Data_Cars$hp)
mean_hp
mean(Data_Cars$wt) 
median(Data_Cars$wt)
names(sort(-table(Data_Cars$wt)))[1] 
sd(Data_Cars$mpg)
var(Data_Cars$mpg)
summary(Data_Cars$mpg)
quantile(Data_Cars$mpg, probs = c(0.25, 0.5, 0.75))
IQR(Data_Cars$mpg)
range(Data_Cars$mpg)
diff(range(Data_Cars$mpg))
cov(Data_Cars$mpg, Data_Cars$hp)
cor(Data_Cars$mpg, Data_Cars$hp)
#correlation plot
pairs(Data_Cars[, c("mpg", "hp", "wt", "qsec")],
      main = "Scatterplot Matrix")
library(ggplot2)
ggplot(Data_Cars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue", size = 2) +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Scatter Plot of MPG vs Weight",
       x = "Weight (1000 lbs)",
       y = "Miles Per Gallon (mpg)") +
  theme_minimal()
hist(mtcars$mpg)
hist(mtcars$wt)
plot(mtcars$mpg, mtcars$wt, 
     pch=19, #solid circle
     cex = 1.5, #max 150% size
     col = "red",
     main = "MPG vs Weight",
     xlab = "Miles Per Gallon (mpg)",
     ylab = "Weight (1000 lbs)")
hist(mtcars$mpg,
     col = "lightblue",
     main = "Distribution of Miles Per gallon",
     xlab = "Mpg",
     ylab = "Frequency")
curve(dnorm(x, mean=mean(mtcars$mpg), sd=sd(mtcars$mpg)),
      from=min(mtcars$mpg), to=max(mtcars$mpg),
      col="red", lwd=2, add=TRUE)
rug(mtcars$mpg, lwd = 2, col = "gray")
summary(mtcars)
summary(iris$Species)          
summary(iris$Sepal.Length)    
summary(iris$Sepal.Width)
describe(iris) #only for quantitative variables
install.packages("psych")
library(psych)
describe(iris)
describe(mtcars)
hist(iris$Petal.Length [iris$Species == "setosa"],
     main = "Histogram of Petal Length (Setosa)",
     xlab = "Petal Length",
     col = "lightblue",
     border = "black")
hist(iris$Petal.Length [iris$Species == "versicolor"],
     main = "Histogram of Petal Length (Versicolor)",
     xlab = "Petal Length",
     col = "green",
     border = "black")
hist(iris$Petal.Length [iris$Species == "virginica"],
     main = "Histogram of Petal Length (viriginica)",
     xlab = "Petal Length",
     col = "red",
     border = "black")
#Selecting values on a categorical variable
#Selecting values on a numeric variable
hist(iris$Sepal.Length[iris$Sepal.Length > 5.0 & iris$Sepal.Length < 7.0],
     main = "Histogram of Sepal Length (5.0 < SL < 7.0)",
     xlab = "Sepal Length",
     col = "lightgreen",
     border = "black")
#simulatenous
hist(iris$Sepal.Length[iris$Species == "setosa" & iris$Sepal.Length < 6.0],
     main = "Histogram of Sepal Length (Setosa & SL < 6.0)",
     xlab = "Sepal Length",
     col = "lightpink",
     border = "black")
i.setosa <- iris[iris$Species == "setosa", ]
i.versicolor <- iris[iris$Species == "versicolor", ]
i.virginica <- iris[iris$Species == "virginica", ]
summary(i.setosa)
hist(i.setosa$Sepal.Length,
     main = "Histogram of Sepal Length (Setosa)",
     xlab = "Sepal Length",
     col = "lightblue",
     border = "black")
V1 <- c(2, 4, 6, 8, 10)
is.vector(V1)
m2 <- matrix(c("a", "b", "c", "d", "e", "f"), nrow = 2, byrow = TRUE)
is.matrix(m2)
m2
