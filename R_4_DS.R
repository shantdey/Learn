library(dplyr)
library(ggplot2)
library(palmerpenguins)
library(nycflights13)
library(tidyr)
View(penguins)
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
geom_point()
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point()
mpg |> filter(cty > 20)
mpg |> filter (cty > 20) |> print(n = 50)
mpg |> filter(hwy == 20)
mpg |> filter( cty > 20 & hwy > 25)
mpg |> filter(cyl %in% c(4,5,6))
audi_mpg_a4 <- mpg |> filter(manufacturer == "audi" & model == "a4")
audi_mpg_a4
#arrange() changes the order of the rows based on the value of the columns. 
#It takes a data frame and a set of column names (or more complicated expressions) 
#to order by f you provide more than one column name, 
#each additional column will be used to break ties in the values of the preceding columns. 
mpg  |> arrange(year, model, manufacturer, cty)
#You can use desc() on a column inside of arrange() to re-order the data frame 
#based on that column in descending (big-to-small) order. 
mpg  |> arrange(desc(hwy))
#distinct() finds all the unique rows in a dataset, so technically, it primarily operates on the rows. 
#Most of the time, however, you’ll want the distinct combination of some variables, 
#so you can also optionally supply column names:
mpg |> distinct() # remove duplicate rows
mpg |> distinct(manufacturer, model)
mpg |> count(manufacturer, model, sort = TRUE)
mpg |> mutate(gain = hwy-cty)
mpg |> mutate(gain = hwy-cty, .before = 1)
mpg |> select(where(is.character))
mpg |> select(manufacturer:cyl)
mpg |> select(!manufacturer:cyl)
mpg |> select(cylinder = cyl)
mpg |> rename(cylinder = cyl)
mpg |> filter(manufacturer == "audi") |>
  mutate(gain = hwy - cty) |>
  select(manufacturer: gain) |>
  arrange(desc(year))
#Use group_by() to divide your dataset into groups meaningful for your analysis:
mtcars |> group_by(cyl)
mtcars |> group_by(cyl) |> summarize(mpg_average = mean(mpg, na.rm = TRUE), n= n())

# df |> slice_head(n = 1) takes the first row from each group.
# df |> slice_tail(n = 1) takes the last row in each group.
# df |> slice_min(x, n = 1) takes the row with the smallest value of column x.
# df |> slice_max(x, n = 1) takes the row with the largest value of column x.
# df |> slice_sample(n = 1) takes one random row.
# You can vary n to select more than one row, or instead of n =, 
# you can use prop = 0.1 to select (e.g.) 10% of the rows in each group. 
mtcars |> group_by(cyl) |> slice_max(mpg, n=1, with_ties = FALSE) |> relocate(disp)
# slice_min() and slice_max() keep tied values so n = 1 means give us all rows with the highest value. 
# If you want exactly one row per group you can set with_ties = FALSE.
peng <- penguins |> group_by(species, island)
peng
peng |> ungroup() |> summarize(avg_bmi = mean(body_mass_g, na.rm = TRUE), sex = n())
penguins |> summarize(avg_bmi = mean(body_mass_g, na.rm = TRUE), n = n(), .by = (sex))
penguins |> mutate(ratio = bill_length_mm/bill_depth_mm)
penguins |> filter(!is.na(bill_depth_mm), !is.na(bill_depth_mm)) |>
  count(sex)
library(ggplot2)
penguins |>
  group_by(year) |>
  summarize(
    avg_body_mass = mean(body_mass_g, na.rm = TRUE),
    n = n()
  ) |>
  
  ggplot(aes(x = year, y = avg_body_mass)) +
  geom_point() +
  geom_line() 
  
ggplot(mtcars, aes(disp, mpg)) +
  geom_point(aes(color = cyl))
library(ggplot2)
library(dplyr)
# install.packages("nycflights13")
library(nycflights13)
glimpse(flights)
not_cancelled <- flights |> 
  filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled
not_cancelled |> 
  group_by(year, month, day) |> 
  summarize(mean = mean(dep_delay))
### XPLORATORY DATA ANALYSIS
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.5)
smaller <- diamonds |> 
  filter(carat < 3)
smaller
ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)
#Outliers
ggplot(diamonds, aes(x = y)) + 
  geom_histogram(binwidth = 0.5)
#To make it easy to see the unusual values, 
#we need to zoom to small values of the y-axis with coord_cartesian()
ggplot(diamonds, aes(x = y)) + 
  geom_histogram(binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))
#there are three unusual values: 0, ~30, and ~60. We pluck them out with dplyr
unusual <- diamonds |> 
  filter(y < 3 | y > 20) |> 
  select(price, x, y, z) |>
  arrange(y)
unusual
#Drop the entire row with the strange values:
diamonds2 <- diamonds |> 
  filter(between(y, 3, 20))
diamonds2
#replacing the unusual values with missing values
#The easiest way to do this is to use mutate() to replace the variable with a modified copy
#You can use the if_else() function to replace unusual values with NA
diamonds2 <- diamonds |> 
  mutate(y = if_else(y < 3 | y > 20, NA, y))
diamonds2
ggplot(diamonds2, aes(x = x, y = y)) + 
  geom_point()
#To suppress that warning, set na.rm = TRUE:
ggplot(diamonds2, aes(x = x, y = y)) + 
  geom_point(na.rm = TRUE)
# %% is a special operator called the modulo operator. 
#It calculates the remainder when one number is divided by another.
#Handling Missing values
#missing values in the dep_time variable indicate that the flight was cancelled.
nycflights13::flights |>
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + (sched_min / 60)
    ) |>
  ggplot(aes(x = sched_dep_time)) +
  geom_freqpoly(aes(color = cancelled), binwidth = 1/4)
 #Covariance
#let’s explore how the price of a diamond varies with its quality (measured by cut) 
ggplot(diamonds, aes(x = price)) + 
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)
#display the density, which is the count standardized so that the 
#area under each frequency polygon is one.
ggplot(diamonds, aes(x = price, y = after_stat(density))) + 
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)
#boxplots
ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot()
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()
#Reorder
install.packages("forcats")
library(forcats)

ggplot(mpg, aes(x = fct_reorder(class, hwy, median), y = hwy)) +
  geom_boxplot()
#flip
ggplot(mpg, aes(x = hwy, y = fct_reorder(class, hwy, median))) +
  geom_boxplot()
#To visualize the covariation between categorical variables,
ggplot(diamonds, aes(x = cut, y = color)) +
  geom_count()
diamonds |> 
  count(color, cut)
diamonds |> 
  count(color, cut) |>  
  ggplot(aes(x = color, y = cut)) +
  geom_tile(aes(fill = n))
ggplot(smaller, aes(x = carat, y = price)) +
  geom_point()
ggplot(smaller, aes(x = carat, y = price)) + 
  geom_point(alpha = 1 / 100)
ggplot(smaller, aes(x = carat, y = price)) +
  geom_bin2d()
#cut_width(x, width), as used above, divides x into bins of width width.
ggplot(smaller, aes(x = carat, y = price)) + 
  geom_boxplot(aes(group = cut_width(carat, 0.1, varwidth = TRUE)))
diamonds |> 
  filter(x >= 4) |> 
  ggplot(aes(x = x, y = y)) +
  geom_point() +
  coord_cartesian(xlim = c(4, 11), ylim = c(4, 11))
#we could create boxes that contain roughly equal number of points with cut_number()
ggplot(smaller, aes(x = carat, y = price)) + 
  geom_boxplot(aes(group = cut_number(carat, 20)))
install.packages("tidymodels")
library(tidymodels)
library(parsnip)

diamonds <- diamonds |>
  mutate(
    log_price = log(price),
    log_carat = log(carat)
  )
model <- linear_reg() %>% 
  set_engine("lm")
diamonds_fit <-fit(model, log_price ~ log_carat, data = diamonds)


diamonds_aug <- augment(diamonds_fit, new_data = diamonds) |>
  mutate(.resid = exp(.resid))

ggplot(diamonds_aug, aes(x = carat, y = .resid)) + 
  geom_point()
  geom_point()
ggplot(diamonds_aug, aes(x = cut, y = .resid)) + 
  geom_boxplot()
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    color = "Car type",
    title = "Fuel efficiency generally decreases with engine size",
    subtitle = "Two seaters (sports cars) are an exception because of their light weight",
    caption = "Data from fueleconomy.gov"
  )
# subtitle adds additional detail in a smaller font beneath the title and 
# caption adds text at the bottom right of the plot, often used to describe 
# the source of the data. You can also use labs() to replace the axis and legend titles

df <- tibble(
  x = 1:10,
  y = cumsum(x^2)
)

ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(x[i]),
    y = quote(sum(x[i] ^ 2, i == 1, n))
  )
# In addition to labelling major components of your plot, it’s often useful to label 
# individual observations or groups of observations. The first tool you have at 
# your disposal is geom_text(). geom_text() is similar to geom_point(), but it has an 
# additional aesthetic: label. This makes it possible to add textual labels to your plots.

label_info <- mpg |>
  group_by(drv) |>
  arrange(desc(displ)) |>
  slice_head(n = 1) |>
  mutate(
    drive_type = case_when(
      drv == "f" ~ "front-wheel drive",
      drv == "r" ~ "rear-wheel drive",
      drv == "4" ~ "4-wheel drive"
    )
  ) |>
select(displ, hwy, drv, drive_type)
label_info

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  geom_text(
    data = label_info, 
    aes(x = displ, y = hwy, label = drive_type),
    fontface = "bold", size = 5, hjust = "right", vjust = "bottom"
  ) +
  theme(legend.position = "none")
#> `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  geom_label_repel(
    data = label_info, 
    aes(x = displ, y = hwy, label = drive_type),
    fontface = "bold", size = 5, nudge_y = 2
  ) +
theme(legend.position = "none")
#> `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class))
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  scale_y_continuous(breaks = seq(15, 40, by = 5)) 
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL) +
  scale_color_discrete(labels = c("4" = "4-wheel", "f" = "front", "r" = "rear"))
library(ggplot2)
base <- ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class))
base + theme(legend.position = "right") # the default
base + theme(legend.position = "left")
base + 
  theme(legend.position = "top") +
  guides(color = guide_legend(nrow = 3))
base + 
  theme(legend.position = "bottom") +
  guides(color = guide_legend(nrow = 3))
#To control the display of individual legends, use guides() along with guide_legend() or guide_colorbar()
#controlling the number of rows the legend uses with nrow, and overriding 
#one of the aesthetics to make the points bigger. 

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom") +
  guides(color = guide_legend(nrow = 2, override.aes = list(size = 4)))
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_bin2d() + 
  scale_x_log10() + 
  scale_y_log10()
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  scale_color_brewer(palette = "Set1")
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv, shape = drv)) +
  scale_color_brewer(palette = "Set1")
df <- tibble(
  x = rnorm(10000),
  y = rnorm(10000)
)
library(ggplot2)
ggplot(df, aes(x, y)) +
  geom_hex() +
  coord_fixed() +
  labs(title = "Default, continuous", x = NULL, y = NULL)
ggplot(df, aes(x, y)) +
  geom_hex(bins = 30) +
  coord_fixed() +
  labs(title = "30 bins, continuous", x = NULL, y = NULL)
ggplot(df, aes(x, y)) +
  geom_hex() +
  coord_fixed() +
  scale_fill_viridis_c() +
  labs(title = "Viridis, continuous", x = NULL, y = NULL)
mpg |>
  filter(displ >= 5 & displ <= 6 & hwy >= 10 & hwy <= 25) |>
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth()
p1 <- ggplot(mpg, aes(x = drv, y = cty, color = drv)) + 
  geom_boxplot(show.legend = FALSE) + 
  labs(title = "Plot 1")

p2 <- ggplot(mpg, aes(x = drv, y = hwy, color = drv)) + 
  geom_boxplot(show.legend = FALSE) + 
  labs(title = "Plot 2")

p3 <- ggplot(mpg, aes(x = cty, color = drv, fill = drv)) + 
  geom_density(alpha = 0.5) + 
  labs(title = "Plot 3")

p4 <- ggplot(mpg, aes(x = hwy, color = drv, fill = drv)) + 
  geom_density(alpha = 0.5) + 
  labs(title = "Plot 4")

p5 <- ggplot(mpg, aes(x = cty, y = hwy, color = drv)) + 
  geom_point(show.legend = FALSE) + 
  facet_wrap(~drv) +
  labs(title = "Plot 5")

(guide_area() / (p1 + p2) / (p3 + p4) / p5) +
  plot_annotation(
    title = "City and highway mileage for cars with different drive trains",
    caption = "Source: https://fueleconomy.gov."
  ) +
  plot_layout(
    guides = "collect",
    heights = c(1, 3, 2, 4)
    ) &
  theme(legend.position = "top")
p1 <- ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  labs(title = "Plot 1")
p2 <- ggplot(mpg, aes(x = drv, y = hwy)) + 
  geom_boxplot() + 
  labs(title = "Plot 2")
p1 + p2
assign("j",4)
j
class(j)
is.numeric(j)
is.integer(j)
is.double(j)
j <- as.integer(j)
j
is.integer(j)
class(4L)
class(2.8)
# The class of a variable is the type of data it contains,
4L*2.8
x <- "data"
x
class(x)
y <- factor("data")
y
nchar(x)
nchar(y)
nchar("hello")
# The nchar() function counts the number of characters in a string.
date1 <- as.Date("2025-10-01")
class(date1)
as.numeric(date1)
date2 <- as.POSIXct("2012-06-28 17:42")
date2
k <- TRUE
class(k)
is.logical(k)
1 :10
10 :1
-2:3
x <- 1:10
y <- 11:20
x+y
length(x)
x <- c(1, 2, 3, 4, 5, 6, 7, 8., 9, 10)
x + c(1,2)
x + c(1,2,3)
x <= 5
y <- c(11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
any(x < y)
all(x < y)
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby",
             "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
nchar(q)
x[3]
x[3:5]
x[c(1, 3, 5)]
q2factor <- as.factor(q)
q2factor
as.numeric(q2factor)
levels(q2factor)
factor(x=c("High School", "College", "Masters", "Doctorate"),
               levels=c("High School", "College", "Masters", "Doctorate"),
             ordered=TRUE)
mean(x)
apropos("mea")
z <- c(1, 2, NA, 8, 3, NA, 3)
mean(z, na.rm = TRUE)
z %>% mean(na.rm=TRUE)
# The pipe operator %>% is used to pass the result of one function as the input to another function.

# 12  Logical vectors
x <- c(1, 2, 3, 5, 7, 11, 13)
x*2
x
library(tidyverse)
library(nycflights13)
df <- tibble(x)
library(dplyr)
df <- df |> 
  mutate(
    y = x * 2,
    z = x + y
  )
df
df |> 
  mutate(
    y = x * 2,
    z = x + y
  ) |> 
  select(x, y, z)
flights |> 
  filter(dep_time > 600 & dep_time < 2000 & abs(arr_delay) < 20)
flights |> 
  mutate(
    daytime = dep_time > 600 & dep_time < 2000,
    approx_ontime = abs(arr_delay) < 20,
    .keep = "used"
  )
flights |> 
  mutate(
    daytime = dep_time > 600 & dep_time < 2000,
    approx_ontime = abs(arr_delay) < 20,
  ) |> 
  filter(daytime & approx_ontime)
x <- c(1 / 49 * 49, sqrt(2) ^ 2)
x
print(x, digits = 16)
near(x, c(1, 2))
# near() is used to compare floating-point numbers for equality,
is.na(c(TRUE, NA, FALSE))
is.na(c(1, NA, 3))
#We can use is.na() to find all the rows with a missing dep_time
flights |> 
  filter(is.na(dep_time)) |> 
  select(year, month, day, dep_time, arr_time)
flights |> 
  filter(is.na(dep_time))
#is.na() can also be useful in arrange()
flights |> 
  filter(month == 1, day == 1) |> 
  arrange(dep_time)
flights |> 
  filter(month == 1, day == 1) |> 
  arrange(desc(is.na(dep_time)), dep_time)
library(tidyverse)
flights |> 
  filter(month == 11 | month == 12)
#x %in% y returns a logical vector the same length as x that is TRUE 
#whenever a value in x is anywhere in y 
flights |> 
  filter(month %in% c(11, 12))
1:12 %in% c(1, 5, 11)
letters[1:10] %in% c("a", "e", "i", "o", "u")
# here are two main logical summaries: any() and all(). any(x) is the equivalent 
# of |; it’ll return TRUE if there are any TRUE’s in x. all(x) is equivalent of &; 
# it’ll return TRUE only if all values of x are TRUE’s. Like most summary functions, 
# you can make the missing values go away with na.rm = TRUE.
any(c(TRUE, FALSE, NA))
all(c(TRUE, FALSE, NA))
any(c(TRUE, FALSE, NA), na.rm = TRUE)
flights |> 
  group_by(year, month, day) |> 
  summarize(
    all_delayed = all(dep_delay <= 60, na.rm = TRUE),
    any_long_delay = any(arr_delay >= 300, na.rm = TRUE),
    .groups = "drop"
  )
# The code above summarizes the flights data by year, month, and day, calculating the
#proportion of flights that were delayed on departure by at most an hour and the 
#number of flights that were delayed on arrival by five hours or more
flights |> 
  group_by(year, month, day) |> 
  summarize(
    prop_delayed = mean(dep_delay <= 60, na.rm = TRUE),
    n_long_delays = sum(arr_delay >= 300, na.rm = TRUE),
    .groups = "drop"
  )
#average delay just for flights that were actually delayed.
#first filter the flights and then calculate the average delay
flights |> 
  filter(arr_delay > 0) |> 
  group_by(year, month, day) |> 
  summarize(
    behind = mean(arr_delay),
    n = n(),
    .groups = "drop"
  )
#
flights |> 
  group_by(year, month, day) |> 
  summarize(
    behind = mean(arr_delay[arr_delay > 0], na.rm = TRUE),
    ahead = mean(arr_delay[arr_delay < 0], na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )
# in the first chunk n() gives the number of delayed flights per day; 
# in the second, n() gives the total number of flights.

#Conditional transformations
#here are two important tools for this: if_else() and case_when().
# if_else() is a vectorized version of the if-else statement.
x <- c(-3:3, NA)
if_else(x > 0, "+ve", "-ve")
if_else(x > 0, "+ve", "-ve", "???")
if_else(x < 0, -x, x)
if_else(x == 0, "0", if_else(x < 0, "-ve", "+ve"), "???")
# case_when() is a vectorized version of the switch statement.
case_when(
  x < 0 ~ "-ve",
  x > 0 ~ "+ve",
  TRUE ~ "0"
)
# case_when() is useful when you have multiple conditions to check.
# It allows you to specify multiple conditions and their corresponding values.
# The TRUE ~ "0" at the end acts as a default case, similar to the else clause in an if-else statement.
#condition ~ output. condition must be a logical vector; when it’s TRUE, output will be used.
x <- c(-3:3, NA)
case_when(
  x == 0   ~ "0",
  x < 0    ~ "-ve", 
  x > 0    ~ "+ve",
  is.na(x) ~ "???"
)
case_when(
  x < 0 ~ "-ve",
  x > 0 ~ "+ve",
  .default = "???"
)
# .default is used to specify a default value when none of the conditions are met.
#if multiple conditions match, only the first will be used:
case_when(
  x > 0 ~ "+ve",
  x > 2 ~ "big"
)
flights |> 
  mutate(
    status = case_when(
      is.na(arr_delay)      ~ "cancelled",
      arr_delay < -30       ~ "very early",
      arr_delay < -15       ~ "early",
      abs(arr_delay) <= 15  ~ "on time",
      arr_delay < 60        ~ "late",
      arr_delay < Inf       ~ "very late",
    ),
    .keep = "used"
  )
#Given a vector of days like x <- c("Monday", "Saturday", "Wednesday"), 
#use an if_else() statement to label them as weekends or weekdays.
x <- c("Monday", "Saturday", "Wednesday")
if_else(x %in% c("Saturday", "Sunday"), "weekend", "weekday")
#Use case_when() to label the days as weekends or weekdays.
case_when(
  x %in% c("Saturday", "Sunday") ~ "weekend",
  TRUE ~ "weekday"
)
#A number is even if it’s divisible by two, which in R you can find out with 
#x %% 2 == 0. Use this fact and if_else() to determine whether each number 
#between 0 and 20 is even or odd.
x <- 0:20
if_else(x %% 2 == 0, "even", "odd")
#Use if_else() to compute the absolute value of a numeric vector called x
x <- c(-3, -2, -1, 0, 1, 2, 3)
if_else(x < 0, -x, x)
library(dplyr)
library(nycflights13)
flights |> 
  mutate(
    gain = arr_delay - dep_delay,
    speed = distance / air_time * 60
  ) |> 
  select(gain, speed)
#readr provides two useful functions for parsing strings into numbers: 
#parse_double() and parse_number(). Use parse_double() when you have numbers 
#that have been written as strings
x <- c("1.2", "5.6", "1e3")
parse_double(x)
parse_number(x)
library(readr)
y <- c("$1000", "$5,000", "$1,000,000")
parse_number(y)
#Use parse_number() when the string contains non-numeric text that you want to ignore
y <- c("1st", "2nd", "3rd", "4th", "5th")
parse_number(y)
flights |> count(dest)
flights |> count(tailnum)
#If you want to see the most common values, add sort = TRUE
flights |> count(dest, sort = TRUE)
flights |> count(tailnum, sort = TRUE)
library(ggplot2)
flights |> 
  group_by(tailnum) |> 
  summarize(
    n = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE),
    .groups = "drop"
  ) |> 
  filter(n > 20, dist < 2000) |> 
  ggplot(aes(x = dist, y = delay)) +
  geom_point(aes(size = n), alpha = 1/3) +
  geom_smooth(se = FALSE)
#And remember that if you want to see all the values, you can use |> View() or |> print(n = Inf)
flights |> 
  group_by(tailnum) |> 
  summarize(
    n = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE),
    .groups = "drop"
  ) |> 
  filter(n > 20, dist < 2000) |> 
  arrange(desc(delay)) |> 
  select(tailnum, n, dist, delay) |> 
  print(n = 20)
#The most important dplyr verbs are:
# filter() picks observations (rows) by their values.
# arrange() changes the order of the rows.
# select() picks variables (columns) by their names.
# mutate() creates new variables that are functions of existing variables.
# summarize() collapses many values down to a single summary.
# group_by() changes the scope of each of the above verbs from operating on the
# entire dataset to operating on groups defined by one or more variables.
#The first five of these verbs all take a data frame as their first argument 
#and return a modified version of that data frame.
flights |> 
  group_by(dest) |> 
  summarize(
    n = n(),
    delay = mean(arr_delay, na.rm = TRUE)
  )
#> `summarise()` ungrouping output (override with `.groups` argument)
#n() is a special summary function that doesn’t take any arguments and instead 
#accesses information about the “current” group. This means that it only works inside dplyr verbs:
tibble(x = 1:10) |> 
  summarize(n())
#> ! Must only be used inside data-masking verbs like `mutate()`,
#>   `filter()`, and `group_by()`.
#There are a couple of variants of n() and count()
# n_distinct(x) counts the number of unique values of x.
# tally() is a shortcut for summarize(n = n())
# count() is a shortcut for group_by() + tally()
flights |> 
  group_by(dest) |> 
  summarize(carriers = n_distinct(carrier)) |> 
  arrange(desc(carriers))
#A weighted count is a sum. For example you could “count” the number of miles each plane flew
flights |> 
  group_by(tailnum) |> 
  summarize(miles = sum(distance, na.rm = TRUE)) |> 
  arrange(desc(miles))
#You can use the .by argument of summarize() to do the grouping for you
flights |> 
  summarize(
    n = n(),
    delay = mean(arr_delay, na.rm = TRUE),
    .by = dest
  ) |> 
  arrange(desc(delay))
#Weighted counts are a common problem so count() has a wt argument that does the same thing
flights |> 
  count(dest, wt = distance, sort = TRUE)
flights |> count(tailnum, wt = distance)
#You can use the .by argument of mutate() to do the grouping for you
flights |> 
  mutate(
    delay = arr_delay - dep_delay,
    .by = tailnum
  ) |> 
  select(tailnum, delay)
#You can count missing values by combining sum() and is.na(). 
#In the flights dataset this represents flights that are cancelled
flights |> 
  summarize(
    n_cancelled = sum(is.na(dep_time)),
    n = n(),
    .by = year
  )
flights |> 
  group_by(dest) |> 
  summarize(n_cancelled = sum(is.na(dep_time))) 
x <- c(1, 2, 10, 20)
x/5
x / c(5, 5, 5, 5)
x / c(5, 10)
x / c(5, 10, 15)
x * c(1, 2)
x * c(1, 2, 3)
x * c(1, 2, 3, 4)
flights |> 
  filter(month == c(1, 2))
df <- tribble(
  ~x, ~y,
  1,  3,
  5,  2,
  7, NA,
)

df |> 
  mutate(
    min = pmin(x, y, na.rm = TRUE),
    max = pmax(x, y, na.rm = TRUE)
  )
#Note that these are different to the summary functions min() and max() which take 
#multiple observations and return a single value. 
#pmin() and pmax() take multiple vectors and return a vector the same length as the longest input.
df |> 
  summarize(
    min = min(x),
    max = max(x)
  )
df |> 
  mutate(
    min = min(x, y, na.rm = TRUE),
    max = max(x, y, na.rm = TRUE)
  )
1:10 %/% 3 # integer division
1:10 %% 3  # remainder
#The most common use of integer division and modulo is to convert between
#hours and minutes. For example, 1345 is 13 hours and 45 minutes after midnight:
time <- 1345
hours <- time %/% 100
minutes <- time %% 100
sprintf("%02d:%02d", hours, minutes)
flights |> 
  mutate(
    hour = sched_dep_time %/% 100,
    minute = sched_dep_time %% 100,
    .keep = "used"
  )
#You can use the .before and .after arguments to control where new variables appear
flights |> 
  mutate(
    hour = sched_dep_time %/% 100,
    minute = sched_dep_time %% 100,
    .before = 1,
    .keep = "used"
  )
#You can use the .keep argument to control which variables are kept in the output
flights |> 
  group_by(hour = sched_dep_time %/% 100) |> 
  summarize(prop_cancelled = mean(is.na(dep_time)), n = n()) |> 
  filter(hour > 1) |> 
  ggplot(aes(x = hour, y = prop_cancelled)) +
  geom_line(color = "grey50") + 
  geom_point(aes(size = n))
round(123.456)
#> [1] 123
round(123.456, 2)  # two digits
round(123.456, 1)  # one digit
round(123.456, -1) # round to nearest ten
round(123.456, -2) # round to nearest hundred
round(c(1.5, 2.5))
##> round() uses what’s known as “round half to even” or Banker’s rounding: 
##> if a number is half way between two integers, it will be rounded to the even integer. 
##> This is a good strategy because it keeps the rounding unbiased: half of 
##> all 0.5s are rounded up, and half are rounded down.
##> This is different to many other programming languages, which always round 0.5 up.
##> round() is paired with floor() which always rounds down and ceiling() which always rounds up
##> and trunc() which rounds towards zero.
##> These functions all take a numeric vector and return an integer vector.
x <- 123.456
round(x)
floor(x)
ceiling(x)
flights |> count(dest)
flights |> count(tailnum)
flights |> count(tailnum, wt = distance)
flights |> count(dest, sort = TRUE)
flights |> count(dest) |> view()
flights |> count(tailnum, wt = distance) |> print (n = Inf)
#n_distinct(x) counts the number of distinct (unique) values of one or more variables
flights |> 
  group_by(dest) |> 
  summarize(carriers = n_distinct(carrier)) |> 
  arrange(desc(carriers))
#A weighted count is a sum. For example you could “count” the number of miles each plane flew
flights |> 
  group_by(tailnum) |> 
  summarize(miles = sum(distance, na.rm = TRUE)) |> 
  arrange(desc(miles))
#Weighted counts are a common problem so count() has a wt argument that does the same thing:
flights |> count(tailnum, wt = distance)
#You can count missing values by combining sum() and is.na(). Cancelled flights
flights |> 
  summarize(
    n_cancelled = sum(is.na(dep_time)),
    n = n(),
    .by = year
  )
flights |> 
  group_by(dest) |> 
  summarize(n_cancelled = sum(is.na(dep_time))) 
#You can use the .by argument of mutate() to do the grouping for you
flights |> 
  mutate(
    delay = arr_delay - dep_delay,
    .by = tailnum
  ) |> 
  select(tailnum, delay)
#R handles mismatched lengths by recycling, or repeating, the short vector. 
#This is most useful when the length of the longer vector is a multiple of the shorter one:
x <- c(1, 2, 10, 20)
x / c(5, 10)
flights |> 
  filter(month == c(1, 2))
#The arithmetic functions work with pairs of variables. Two closely related functions 
#are pmin() and pmax(), which when given two or more variables will return the 
#smallest or largest value in each row
flights |> 
  select(dep_time, sched_dep_time) |> 
  mutate(
    earliest = pmin(dep_time, sched_dep_time, na.rm = TRUE),
    latest   = pmax(dep_time, sched_dep_time, na.rm = TRUE)
  )
#Note that these are different to the summary functions min() and max() which take
#%/% does integer division and %% computes the remainder:
1:10 %/% 3
1:10 %% 3
#The most common use of integer division and modulo is to convert between hours and minutes.
flights |> 
  mutate(
    hour = sched_dep_time %/% 100,
    minute = sched_dep_time %% 100,
    .keep = "used"
  )
flights |> 
  group_by(hour = sched_dep_time %/% 100) |> 
  summarize(prop_cancelled = mean(is.na(dep_time)), n = n()) |> 
  filter(hour > 1) |> 
  ggplot(aes(x = hour, y = prop_cancelled)) +
  geom_line(color = "grey50") + 
  geom_point(aes(size = n))
#You can use the .before and .after arguments to control where new variables appear
flights |> 
  mutate(
    hour = sched_dep_time %/% 100,
    minute = sched_dep_time %% 100,
    .before = 1,
    .keep = "used"
  )
#Use cut()1 to break up (aka bin) a numeric vector into discrete buckets:
x <- c(rnorm(1000), rnorm(1000) + 4)
x
cut(x, breaks = 5)
x <- c(1, 2, 5, 10, 15, 20)
cut(x, breaks = c(0, 5, 10, 15, 20))
#You can optionally supply your own labels. Note that there should be one less labels than breaks.
cut(x, 
    breaks = c(0, 5, 10, 15, 20), 
    labels = c("sm", "md", "lg", "xl")
)
y <- c(NA, -10, 5, 10, 30)
cut(y, breaks = c(0, 5, 10, 15, 20))
x <- 1:10
cumsum(x)
cummean(x)
cumprod(x)
cummin(x)
cummax(x)
cumall(x < 5)
cumany(x < 5)
#The cumulative functions are most useful when paired with arrange() to put the data in the right order
flights |> 
  filter(!is.na(dep_delay)) |> 
  arrange(tailnum, year, month, day) |> 
  mutate(cum_delay = cumsum(dep_delay)) |> 
  select(tailnum, year, month, day, dep_delay, cum_delay)
x <- c(1, 2, 2, 3, 4, NA)
min_rank(x)
#Note that the smallest values get the lowest ranks; 
# use desc(x) to give the largest values the smallest ranks
min_rank(desc(x))
df <- tibble(x = x)
df |> mutate(rank = min_rank(x))
df |> mutate(rank = min_rank(desc(x)))
df |> mutate(rank = dense_rank(x))
df |> mutate(rank = percent_rank(x))
df |> mutate(rank = cume_dist(x))
df |> 
  mutate(
    row_number = row_number(x),
    dense_rank = dense_rank(x),
    percent_rank = percent_rank(x),
    cume_dist = cume_dist(x)
  )
x <- c(2, 5, 11, 11, 19, 35)
lag(x)
x-lag(x)
#x == lag(x) tells you when the current value changes.
x == lag(x)
#This is useful for identifying runs of repeated values
flights |>
  group_by(year, month, day) |>
  summarize(
    mean = mean(dep_delay, na.rm = TRUE),
    median = median(dep_delay, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  ) |> 
  ggplot(aes(x = mean, y = median)) + 
  geom_abline(slope = 1, intercept = 0, color = "white", linewidth = 2) +
  geom_point()
#quantile(x, 0.95) will find the value that’s greater than 95% of the values.
flights |>
  group_by(year, month, day) |>
  summarize(
    max = max(dep_delay, na.rm = TRUE),
    q95 = quantile(dep_delay, 0.95, na.rm = TRUE),
    .groups = "drop"
  )
flights |> 
  group_by(origin, dest) |> 
  summarize(
    distance_iqr = IQR(distance), 
    n = n(),
    .groups = "drop"
  ) |> 
  filter(distance_iqr > 0)
flights |> 
  group_by(year, month, day) |> 
  summarize(
    first_dep = first(dep_time, na_rm = TRUE), 
    fifth_dep = nth(dep_time, 5, na_rm = TRUE),
    last_dep = last(dep_time, na_rm = TRUE)
  )

# x / sum(x) calculates the proportion of a total.
# (x - mean(x)) / sd(x) computes a Z-score (standardized to mean 0 and sd 1).
# (x - min(x)) / (max(x) - min(x)) standardizes to range [0, 1].
# x / first(x) computes an index based on the first observation.
string1 <- "This is a string"
string2 <- 'If I want to include a "quote" inside a string, I use single quotes'
#To include a literal single or double quote in a string, you can use \ to “escape” it:
backslash <- "\\"
x <- c(single_quote, double_quote, backslash)
x
str_view(x)
library(tidyverse)
x1 <- c("Dec", "Apr", "Jan", "Mar")
month_levels <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
y1 <- factor(x1, levels = month_levels)
y1
sort(y1)
ordered(c("Dec", "Apr", "Jan", "Mar"))
library(tidyverse)
library(nycflights13)
library(dplyr)
today()
flights |> 
  filter(month == month(today()), day == day(today()))
now()
csv <- "
  date
  01/02/15
"
read_csv(csv, col_types = cols(date = col_date("%m/%d/%y")))
read_csv(csv, col_types = cols(date = col_date()))
ymd("2017-01-31")
flights |> 
  select(year, month, day, hour, minute)
flights |> 
  select(year, month, day, hour, minute) |> 
  mutate(departure = make_datetime(year, month, day, hour, minute))
x <- c(1, 4, 5, 7, -99)
na_if(x, -99)
#> [1]  1  4  5  7 NA
x <- c(1, 4, 5, 7, NA)
coalesce(x, 0)
#> [1] 1 4 5 7 0
x <- c(NA, NaN)
x * 10
#> [1]  NA NaN
x == 1
#> [1] NA NA
is.na(x)
#> [1] TRUE TRUE
is.nan(x)
stocks <- tibble(
  year  = c(2020, 2020, 2020, 2020, 2021, 2021, 2021),
  qtr   = c(   1,    2,    3,    4,    2,    3,    4),
  price = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
stocks |>
  pivot_wider(
    names_from = qtr, 
    values_from = price
  )
#> # A tibble: 2 × 5
#>    year   `1`   `2`   `3`   `4`
#>   <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  2020  1.88  0.59  0.35 NA   
#> 2  2021 NA     0.92  0.17  2.6
stocks |>
  complete(year, qtr)
stocks |>
  complete(year = 2019:2021, qtr)
#> # A tibble: 12 × 3
#>    year   qtr price
#>   <dbl> <dbl> <dbl>
#> 1  2019     1 NA   
#> 2  2019     2 NA   
#> 3  2019     3 NA   
#> 4  2019     4 NA   
#> 5  2020     1  1.88
#> 6  2020     2  0.59
#> # ℹ 6 more rows
#> dplyr::anti_join(x, y) is a particularly useful tool here because it selects only the rows in x 
#> that don’t have a match in y. For example, we can use two anti_join()s to reveal that 
#> we’re missing information for four airports and 722 planes mentioned in flights

flights |> 
  distinct(faa = dest) |> 
  anti_join(airports)
flights |> 
  distinct(tailnum) |> 
  anti_join(planes)
health <- tibble(
  name   = c("Ikaia", "Oletta", "Leriah", "Dashay", "Tresaun"),
  smoker = factor(c("no", "no", "no", "no", "no"), levels = c("yes", "no")),
  age    = c(34, 88, 75, 47, 56),
)
health |> count(smoker)
#> # A tibble: 1 × 2
#>   smoker     n
#>   <fct>  <int>
#> 1 no         5
health |> count(smoker, .drop = FALSE)
#> # A tibble: 2 × 2
#>   smoker     n
#>   <fct>  <int>
#> 1 yes        0
#> 2 no         5
ggplot(health, aes(x = smoker)) +
  geom_bar() +
  scale_x_discrete()

ggplot(health, aes(x = smoker)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)
health |> 
  group_by(smoker) |> 
  summarize(
    n = n(),
    mean_age = mean(age),
    min_age = min(age),
    max_age = max(age),
    sd_age = sd(age)
  )
#> # A tibble: 2 × 6
#>   smoker     n mean_age min_age max_age sd_age
#>   <fct>  <int>    <dbl>   <dbl>   <dbl>  <dbl>
#> 1 yes        0      NaN     Inf    -Inf   NA  
#> 2 no         5       60      34      88   21.6
# A vector containing two missing values
x1 <- c(NA, NA)
length(x1)
#> [1] 2

# A vector containing nothing
x2 <- numeric()
length(x2)
#> [1] 0
#> Sometimes a simpler approach is to perform the summary and then make the 
#> implicit missings explicit with complete()
health |> 
  group_by(smoker) |> 
  summarize(
    n = n(),
    mean_age = mean(age),
    min_age = min(age),
    max_age = max(age),
    sd_age = sd(age)
  ) |> 
  complete(smoker)
#> # A tibble: 2 × 6
#>   smoker     n mean_age min_age max_age sd_age
#>   <fct>  <int>    <dbl>   <dbl>   <dbl>  <dbl>
#> 1 yes       NA       NA      NA      NA   NA  
#> 2 no         5       60      34      88   21.6
#> JOINS
airlines
flights |> 
  count(carrier) |> 
  left_join(airlines, by = c("carrier" = "carrier")) |> 
  arrange(desc(n))
airports
flights |> 
  count(dest) |> 
  left_join(airports, by = c("dest" = "faa")) |> 
  arrange(desc(n)) |> 
  select(n, dest, name, lat, lon)
planes
weather
flights |> 
  select(origin, year, month, day, hour, temp, wind_speed, precip) |> 
  left_join(weather, by = c("origin", "year", "month", "day", "hour"))
#A foreign key is a variable (or set of variables) that corresponds to a primary key in another table
#flights$tailnum is a foreign key that corresponds to the primary key planes$tailnum.
#flights$carrier is a foreign key that corresponds to the primary key airlines$carrier
#flights$origin is a foreign key that corresponds to the primary key airports$faa
#flights$dest is a foreign key that corresponds to the primary key airports$faa
#flights$origin-flights$time_hour is a compound foreign key that corresponds to
#the compound primary key weather$origin-weather$time_hour
#A primary key is a variable (or set of variables) that uniquely identifies each row in a table.
#planes records data about each plane. You can identify a plane by its tail number, making tailnum the primary key.
# airlines records two pieces of data about each airline: its carrier code and its full name. 
# You can identify an airline with its two letter carrier code, making carrier the primary key
# airports records data about each airport. You can identify an airport by its three letter faa code, making faa the primary key.
#weather records data about the weather at the origin airports. You can identify each observation by the combination of location and time, 
#making origin and time_hour the compound primary key.
#There are three main types of joins: inner, left, and right.
# An inner join keeps only the rows that have matching keys in both tables.
flights |> 
  inner_join(airlines, by = c("carrier" = "carrier"))
# A left join keeps all the rows in the left table, and adds matching rows from the right table.
flights |> 
  left_join(airlines, by = c("carrier" = "carrier"))
# A right join keeps all the rows in the right table, and adds matching rows from the left table.
flights |> 
  right_join(airlines, by = c("carrier" = "carrier"))
# A full join keeps all the rows in both tables, and matches up rows where possible.
flights |> 
  full_join(airlines, by = c("carrier" = "carrier"))
#When you join two tables, there are three possible outcomes for each row in the
#left table:
# 1. There is exactly one matching row in the right table.
# 2. There are no matching rows in the right table.
# 3. There are multiple matching rows in the right table.
#In case 1, the result contains the columns from both tables.
#In case 2, the result contains the columns from the left table, and NA values in the new columns from the right table.
#In case 3, the result contains multiple rows: one for each matching row in the right table.
#When there are multiple matches, the result is known as a Cartesian
#join because all combinations of the matching rows are included in the output.
flights |> 
  inner_join(planes, by = c("tailnum" = "tailnum"))
planes |> 
  count(tailnum) |> 
  filter(n > 1)
#> # A tibble: 0 × 2
#> # ℹ 2 variables: tailnum <chr>, n <int>
?count
weather |> 
  count(time_hour, origin) |> 
  filter(n > 1)
#> # A tibble: 0 × 3
#> # ℹ 3 variables: time_hour <dttm>, origin <chr>, n <int>
planes |> 
  filter(is.na(tailnum))
#> # A tibble: 0 × 9
#> # ℹ 9 variables: tailnum <chr>, year <int>, type <chr>, manufacturer <chr>,
#> #   model <chr>, engines <int>, seats <int>, speed <int>, engine <chr>

weather |> 
  filter(is.na(time_hour) | is.na(origin))
#> # A tibble: 0 × 15
#> # ℹ 15 variables: origin <chr>, year <int>, month <int>, day <int>,
#> #   hour <int>, temp <dbl>, dewp <dbl>, humid <dbl>, wind_dir <dbl>, …
#Primary and foreign keys

# Primary and Foreign Keys ------------------------------------------------

# airlines records two pieces of data about each airline: its carrier code and its full name. 
# You can identify an airline with its two letter carrier code, making carrier the primary key.
airlines
# planes records data about each plane. You can identify a plane by its tail number, 
#making tailnum the primary key.
airports
# airports records data about each airport. You can identify an airport by its three letter faa code, 
#g faa the primary key.
planes
# weather records data about the weather at the origin airports.
weather
planes |> 
  count(tailnum) |> 
  filter(n > 1)
weather |> 
  count(time_hour, origin) |> 
  filter(n > 1)
#check for missing values in your primary keys
planes |> 
  filter(is.na(tailnum))
weather |> 
  filter(is.na(time_hour) | is.na(origin))
#Flights - Surrogate Keys
#there are three variables that together uniquely identify each flight
flights |> 
  count(time_hour, carrier, flight) |> 
  filter(n > 1)
flights2 <- flights |> 
  mutate(id = row_number(), .before = 1)
#row number is surrogate key
flights2
airports |>
  count(alt, lat) |> 
  filter(n > 1)
flights2 <- flights |> 
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2
flights2 |> 
  left_join(airports, by = c("origin" = "faa")) |> 
  left_join(airports, by = c("dest" = "faa"), suffix = c("_origin", "_dest"))
flights2 |>
  left_join(airlines)
flights2 |> 
  left_join(weather |> select(origin, time_hour, temp, wind_speed))
flights2 |> 
  left_join(planes |> select(tailnum, type, engines, seats))
flights2 |> 
  filter(tailnum == "N3ALAA") |> 
  left_join(planes |> select(tailnum, type, engines, seats))
flights2 |> 
  left_join(planes)
flights2 |> 
  left_join(planes, join_by(tailnum))
flights2 |> 
  left_join(airports, join_by(dest == faa))
#Semijoins
#A semijoin keeps all the rows in the left table that have a match in the right table,
airports |> 
  semi_join(flights2, join_by(faa == origin))
airports |> 
  semi_join(flights2, join_by(faa == dest))
#An anti join keeps all the rows in the left table that don’t have a match in the right table.
airports |> 
  anti_join(flights2, join_by(faa == origin))
# we can find rows that are missing from airports by looking for 
#flights that don’t have a matching destination airpor
flights2 |> 
  anti_join(airports, join_by(dest == faa)) |> 
  distinct(dest)
#we can find which tailnums are missing from planes

flights2 |>
  anti_join(planes, join_by(tailnum)) |> 
  distinct(tailnum)
top_dest <- flights2 |>
  count(dest, sort = TRUE) |>
  head(10)
top_dest
airports |>
  semi_join(flights, join_by(faa == dest)) |>
  ggplot(aes(x = lon, y = lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()
# How do Joins Work
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)
inner_join(x, y, by = "key")
left_join(x, y, by = "key")
right_join(x, y, by = "key")
full_join(x, y, by = "key")

x |> inner_join(y, join_by(key == key), keep = TRUE)

#Non Equi Joins
