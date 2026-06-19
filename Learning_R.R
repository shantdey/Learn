
1+3
x <- 10
y <- 5
x+y
x*y
x/y
x^y
x%%y
x%/%y
sqrt(x)
# This is a comment
# This sessions is for teaching and learning R
# We are here to learn R programming
a <- 33
b <- 45
a
print(a)
print(a+b)
print(a*b)
if (a > b) {
  print("a is greater than b")
} else {
  print("a is not greater than b")
}
for (i in 1:5) {
  print(i)
}
#To check if a is even or odd
a = 20
if (a %% 2 == 0) {
  print("a is even")
} else {
  print("a is odd")}
while (a > 0) {
  print(a)
  a <- a - 5
}
i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1
  if(i == 4) { break }
}
Firstname <- list("John", "Jane", "Doe")
print(Firstname)
Numbers <- c(10, 20, 30, 40, 50)
print(Numbers)
Mixed <- c("Hello", 100, TRUE, 3.14)
Mixed
print(Mixed)
for (i in 1:10) {
  if (i  == 3) { next #skip 3
  } 
    print(i)
  }
for (i in 1:10) {
  if (i == 4) { break #break out of loop
  } 
    print(i)
}
#coercion
mixed_vector <- c(1, "two", 3.0, TRUE)
print(mixed_vector)
#Data Frame
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Is_Student = c(TRUE, FALSE, TRUE)
)
print(df)
x1 <- 1.5
typeof(x1)
x2 <- 5L
typeof(x2)
x3 <-" String"
typeof(x3)
v <- c(1,2,3,4,5)
v
is.numeric(v)
is.integer(v)
is.vector(v)
#Array - give data then dimensions, rows, columns, tables
array1 <- array(1:24, dim = c(3,4,2))
array1

#Matrix
#Matrix1 <- matrix(1:9, nrow = 3, ncol = 3)
#Vectors
# dice = c(1,2,3,4,5,6)
# for (x in dice) {
#   print(x)
# }
#Nested Loops
# adj <- list("red", "big", "tasty")
# fruits <- list("apple", "banana", "cherry")
# for (x in adj) {
#   for (y in fruits) {
#     print(paste(x, y))
#   }
# }
#Function
#simple functions
# my_function <- function() {
#   print("Hello, this is my first function in R!")
# }
# my_function()
# add_numbers <- function(num1, num2) {
#   sum <- num1 + num2
#   return(sum)
# }
# add_numbers(5, 10)
# result <- add_numbers(15, 25)
# print(result)
# multiply_numbers <- function(a, b) {
#   product <- a * b
#   return(product)
# }
# multiply_numbers(4, 5)
#nested functions
# Nested_function <- function(x) {
#   inner_function <- function(y) {
#     return(y * 2)
#   }
#   result <- inner_function(x) + 3
#   return(result)
# }
a  <- c(1, 1, 0, 1)
b  <- c(0, 1, 0, 1)
ifelse(a == 1 & b == 1, "Both True", "At least one False")
# Nested_function(5)
#Recursive function
factorial <- function(n) {
  if (n == 0) {
    return(1)
  } else {
    return(n * factorial(n - 1))
  }
}
factorial(5)
recursion <- function(k) {
  if (k > 0) {
    result <- k + recursion(k - 1) # 1+ 0, 2+1, 3+2+1, 4+3+2+1, 5+4+3+2+1
    print(result)
  } else {
    result <- 0
  }
  return(result)
}
recursion(5)
# Lambda function
square <- function(x) x^2
square(6)
cube <- function(x) x^3
cube(3)
txt <- "awesome"
my_function = function() {
  paste("R is", txt)
}
my_function()
Basic_List = list("Apple", "Banana", "Cherry")
print(Basic_List)
print(Basic_List[2])
print(Basic_List[[2]])
print(length(Basic_List))
Modified_list <- Basic_List[-1]
Modified_list
Modified_list[1] <- "Orange"
thismatrix <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
print(thismatrix)
thismatrix[c(1,3),2]
thismatrix[2,]
thismatrix[c(2,1),]
thisarray <- c(1:24)
dim(thisarray) <- c(3,4,2)
print(thisarray)
thisarray[,,2]
thisarray[2,,]
thisarray[,3,]
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray
multiarray[3,,]
thisarray <- c(1:24)
thisarray
#create a Data Frame
Data_Frame <- data.frame (
  Name <- c("John", "Alice", "Bob"),
  Age <- c(25, 30, 22),
  City <- c("New York", "Los Angeles", "Chicago")
)
#can combine vectors of the same length
v1 <- c("John", "Alice", "Bob")
v2 <- c(25, 30, 22)
v3 <- c("New York", "Los Angeles", "Chicago")
Data_Frame1 <- data.frame(Name = v1, Age = v2, City = v3)
df1 <- as.data.frame(cbind(v1, v2, v3)) #unintentional coercion unless as.data.frame is given
df1
Data_Frame
Data_Frame1
print(Data_Frame)
print(Data_Frame$Name)
print(Data_Frame[2,])
head(Data_Frame)
summary(Data_Frame)
str(Data_Frame)

o1 <-c(1,2,3,4,5)
o2 <- c("RT")
list1 <- list(o1, o2)
list1
Food = c("rice", "bread", "milk", "eggs")
length(Food)
for (item in Food) {
  print(item)
}
#Add Additional Rows and Columns - rbind and cbind
thismatrix
new_row <- c(7, 8)
thismatrix <- rbind(thismatrix, new_row)
thismatrix
new_col <- c(9, 10, 11, 12)
thismatrix <- cbind(thismatrix, new_col)
thismatrix
#Remove Rows and Columns
thismatrix <- thismatrix[-1, ]
thismatrix
thismatrix <- thismatrix[, -2]
thismatrix
thismatrix <- thismatrix[-c(1), -c(1)]
thismatrix
11%in% thismatrix
newmatrix <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
newmatrix
for (rows in 1:nrow(newmatrix)) {
  for (cols in 1:ncol(newmatrix)) {
    print(newmatrix[rows, cols])
  }
}
sum(newmatrix)
mean(newmatrix)
max(newmatrix)
min(newmatrix)
t(newmatrix)
Matrix1 <- matrix(c("apple", "banana", "cherry", "grape"), nrow = 2, ncol = 2)
Matrix2 <- matrix(c("orange", "kiwi", "mango", "peach"), nrow = 2, ncol = 2)
Matrix_Combined <- rbind(Matrix1, Matrix2)
Matrix_Combined
Matrix_Combined2 <- cbind(Matrix1, Matrix2)
Matrix_Combined2
#Learn about Factors
colors <- c("red", "blue", "green", "blue", "red", "green", "green")
colors
factor_colors <- factor(colors)
factor_colors
print(factor_colors)
levels(factor_colors)
table(factor_colors)
as.numeric(factor_colors)

factor_colors <- factor(colors, levels = c("red", "blue", "green", "yellow"))
factor_colors
x <- c("A", "B", "C", "D")
y <- c(2, 4, 6, 8)
barplot(y, names.arg = x,
      )
barplot(y, names.arg = x,
        col = "blue",
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values")
hist(y,
     col = "green",
     main = "Simple Histogram",
     xlab = "Values",
     ylab = "Frequency")
plot(1:10, type="l")
plot(1:10, type="p")
plot(1:10, type="b")
plot(1:10, type="h")
plot(1:10, type="s")
plot(1:10, type="o")
plot(1:10, type="S")
plot(1:10, main="My Graph", xlab="The x-axis", ylab="The y axis")
mpar <- par(no.readonly = TRUE) # save default, for resetting...

plot(1:10, col="red")
#Use cex=number to change the size of the points (1 is default, while 0.5 means 50% smaller
plot(1:10, col="red", cex=2)
#Use pch=number to change the shape of the points
plot(1:10, col="red", pch=19)
#Line Graphs
plot(1:10, type="l") 
plot(1:10, type="l", lty=2)
plot(1:10, type="l", lwd=2)
plot(1:10, type="l", lty=2, lwd=2)
plot(1:10, type="l", lty=2, lwd=2, col="blue")
#Muliple Lines
Line1 <- c(1,2,3,4,5,10)
Line2 <- c(2,3,4,5,6,11)
plot(Line1, type="o", col="blue", ylim=c(0,12))
lines(Line2, type="o", col="red")
#Scatterplots
x <- c(1,2,3,4,5,6,7,8,9,10)
y <- c(2,3,5,7,11,13,17,19,23,29)
plot(x, y, main="Scatterplot Example", xlab="X Values", ylab="Y Values", pch=19, col="blue")
#Piechart
slices <- c(10, 12, 4, 16, 8)
labels <- c("A", "B", "C", "D", "E")
pie(slices, labels = labels, main="Pie Chart Example", col=rainbow(length(labels)))
#with init angle
pie(slices, labels = labels, main="Pie Chart Example", col=rainbow(length(labels)), init.angle=90)

install.packages("tidytext")
library(tidytext)
library(dplyr)
library(ggplot2)    
text_data <- data.frame(
  line = c(1, 2, 3, 4, 5),
  text = c("I love programming in R",
           "Data science is fascinating",
           "R makes data analysis easier",
           "I enjoy learning new things",
           "Statistics is the backbone of data science"))
# Tokenize the text data
tidy_text <- text_data %>%
  unnest_tokens(word, text) #unnest_toekns to convert your text into one token per row format
# View the tidy text data
print(tidy_text)
#remove stop words
cleaned_text <- tidy_text %>%
  anti_join(get_stopwords()) #join with a stopword lexicon to remove common words
print(cleaned_text)
#remove number of punctuation using filter()Using Regex
cleaned_text <- cleaned_text %>%
  filter(!grepl("\\d", word, "^[0-9]+$")) #filter out numbers
#filter(!str_detect(word, "^[[:punct:]]+$")) #filter out punctuation
print(cleaned_text)
#Word Frequency Count
word_count <- cleaned_text %>%
  count(word, sort = TRUE) #count word frequency
print(word_count)
summary(word_count)
barplot(word_count$n,
        col = "lightblue",
        main = "Word Frequency Count",
        xlab = "Words",
        ylab = "Frequency")
#Visualize Word Frequencies
ggplot(word_count, aes(x = reorder(word, n), y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() + #swap the x and y axes of a plot, effectively rotating it by 90 degrees. 
  labs(title = "Word Frequency Count",
       x = "Words",
       y = "Frequency") +
  theme_minimal() #provides a clean, minimalistic starting point for plots by 
#removing background clutter like gridlines and borders, focusing on the data
#Word Cloud Visualization
install.packages("wordcloud")
library(wordcloud)
set.seed(1234) #for reproducibility
wordcloud(words = word_count$word,
          freq = word_count$n,
          min.freq = 1,
          max.words = 100,
          random.order = FALSE,
          colors = brewer.pal(8, "Dark2"))
#The set.seed() function is used to set the starting point for generating a sequence of random numbers.
#This ensures that every time you run the code with the same seed value, you get the 
#same sequence of random numbers, making your results reproducible.
#Hashtag and keyword Trend Analysis
library(tidyselect)
library(lubridate)
library(stringr)
library(tidyr)
library(tidyselect)
# Thelubridate package helps with date manipulation
# The stringr package provides functions for string manipulation
# The tidyr package is used for data tidying
# Sample social media data
social_media_data <- data.frame(
  timestamp = c("2023-10-01 10:00:00", "2023-10-01 11:00:00", "2023-10-02 12:00:00",
                "2023-10-02 13:00:00", "2023-10-03 14:00:00"),
  content = c("Loving the new features in R! #RStats #DataScience",
              "Data visualization is key! #DataViz #RStats",
              "Just attended a great webinar on R programming. #RStats",
              "Exploring data with R is fun! #DataScience #RStats",
              "Learning new techniques in R every day! #RStats #Learning")
)
# Convert timestamp to date-time format
social_media_data$timestamp <- ymd_hms(social_media_data$timestamp)
# Extract date
social_media_data$date <- as.Date(social_media_data$timestamp)
# Extract hashtags
social_media_data <- social_media_data %>%
  mutate(hashtags = str_extract_all(content, "#\\w+"))
print(social_media_data)
# Unnest hashtags for analysis
hashtags_data <- social_media_data %>%
  unnest(hashtags)
print(hashtags_data)
# Count hashtag frequency by date
hashtag_trends <- hashtags_data %>%
  group_by(date, hashtags) %>%
  summarise(frequency = n()) %>%
  arrange(date, desc(frequency))
print(hashtag_trends)
# Visualize hashtag trends over time
ggplot(hashtag_trends, aes(x = date, y = frequency, color = hashtags)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Hashtag Trends Over Time",
       x = "Date",
       y = "Frequency") +
  theme_minimal()
# Sentiment Analysis
install.packages("syuzhet")
library(syuzhet)
# Sample text data for sentiment analysis
text_samples <- c(
  "I love programming in R! It's so much fun and powerful.",
  "Data science can be challenging, but it's rewarding.",
  "I hate bugs in my code. They are so frustrating!",
  "Learning new things in R makes me happy.",
  "Debugging is a tedious task, but necessary."
)
# Get sentiment scores using the "syuzhet" method
sentiment_scores <- get_sentiment(text_samples, method = "syuzhet")
# Create a data frame with text samples and their sentiment scores
sentiment_data <- data.frame(
  text = text_samples,
  sentiment_score = sentiment_scores
)
print(sentiment_data)
# Visualize sentiment scores
ggplot(sentiment_data, aes(x = reorder(text, sentiment_score), y = sentiment_score)) +
  geom_bar(stat = "identity", fill = "lightgreen") +
  coord_flip() +
  labs(title = "Sentiment Analysis of Text Samples",
       x = "Text Samples",
       y = "Sentiment Score") +
  theme_minimal()
# Positive, Negative, Neutral Sentiment Classification
sentiment_data <- sentiment_data %>%
  mutate(sentiment_category = case_when(
    sentiment_score > 0 ~ "Positive",
    sentiment_score < 0 ~ "Negative",
    TRUE ~ "Neutral"
  ))
print(sentiment_data)
# Visualize sentiment categories
ggplot(sentiment_data, aes(x = sentiment_category, fill = sentiment_category)) +
  geom_bar() +
  labs(title = "Sentiment Category Distribution",
       x = "Sentiment Category",
       y = "Count") +
  theme_minimal()
# The case_when() function is used to create a new variable based on conditions.
# It allows you to specify multiple conditions and their corresponding values in a readable format.
# In this example, we classify sentiment scores into "Positive", "Negative", and "Neutral" categories.
# Each condition is checked in order, and the first one that evaluates to TRUE determines the value assigned to the new variable.

# Time Series Analysis of Sentiment Over Time
# Sample time-stamped text data
time_stamped_data <- data.frame(
  timestamp = c("2023-10-01 10:00:00", "2023-10-01 11:00:00", "2023-10-02 12:00:00",
                "2023-10-02 13:00:00", "2023-10-03 14:00:00"),
  text = c("I love programming in R! #RStats",
           "Data science can be challenging.",
           "I hate bugs in my code.",
           "Learning new things in R makes me happy.",
           "Debugging is a tedious task.")
)
# Convert timestamp to date-time format
time_stamped_data$timestamp <- ymd_hms(time_stamped_data$timestamp)
# Extract date
time_stamped_data$date <- as.Date(time_stamped_data$timestamp)
# Get sentiment scores
time_stamped_data$sentiment_score <- get_sentiment(time_stamped_data$text, method = "syuzhet")
# Aggregate sentiment scores by date
sentiment_over_time <- time_stamped_data %>%
  group_by(date) %>%
  summarise(average_sentiment = mean(sentiment_score))
print(sentiment_over_time)
# Visualize sentiment over time
ggplot(sentiment_over_time, aes(x = date, y = average_sentiment)) +
  geom_line(color = "purple", size = 1) +
  geom_point(size = 2) +
  labs(title = "Average Sentiment Over Time",
       x = "Date",
       y = "Average Sentiment Score") +
  theme_minimal()