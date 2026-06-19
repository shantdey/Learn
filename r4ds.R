library(dplyr)
library(tidyr)
library(ggplot2)

ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_hex()
ggsave("diamonds.png")

write_csv(diamonds, "data/diamonds.csv")
library(palmerpenguins)
library(ggthemes)
penguins
glimpse(penguins)
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species",
    caption = "data comes from Plamerpenguins package"
  ) +
  scale_color_colorblind()
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g )
) +
  geom_point(mapping = aes(color = bill_depth_mm)) +
  geom_smooth(se = FALSE)

penguins |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()
ggplot(penguins, aes(x = species)) +
  geom_bar()

library(forcats)
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200, fill = "blue")
ggplot(penguins, aes(x = body_mass_g)) +
  geom_density(color = "red")
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()
ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_density(linewidth = 0.75)
ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.5)
#Two categorical variables
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()
#The second plot, a relative frequency plot created by setting position = "fill" 
#in the geom, is more useful for comparing species distributions across islands
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")
#plit your plot into facets, subplots that each display one subset of the data.
#To facet your plot by a single variable, use facet_wrap()
#variable that you pass to facet_wrap() should be categorical
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

##DATA TRANSFORMATION
library(nycflights13)
flights
#flights is a tibble, a special type of data frame used by the tidyverse 
#The most important difference between tibbles and data frames is the way tibbles 
#print; they are designed for large datasets, so they only show the first few rows 
#and only the columns that fit on one screen.
library(dplyr)
print(flights, width = Inf)
# glimpse(flights)
flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )
flights |> 
  filter(dep_delay > 120)
# Flights that departed on January 1
flights |> 
  filter(month == 1 & day == 1)
# Flights that departed in January or February
flights |> 
  filter(month == 1 | month == 2)
# A shorter way to select flights that departed in January or February
flights |> 
  filter(month %in% c(1, 2))
#arrange() changes the order of the rows based on the value of the columns.
#It takes a data frame and a set of column names (or more complicated expressions) 
#to order by.
flights |> 
  arrange(year, month, day, dep_time)
#desc() on a column inside of arrange() to re-order the data frame based on that 
#column in descending (big-to-small) order
flights |> 
  arrange(desc(dep_delay))
#distinct() finds all the unique rows in a dataset,
# Remove duplicate rows, if any
flights |> 
  distinct()
# Find all unique origin and destination pairs
flights |> 
  distinct(origin, dest)
#if you want to keep the other columns when filtering for unique rows, you can 
#use the .keep_all = TRUE option
flights |> 
  distinct(origin, dest, .keep_all = TRUE)
#If you want to find the number of occurrences instead, you’re better off swapping 
#distinct() for count(). With the sort = TRUE argument, you can arrange them in 
#descending order of the number of occurrences
flights |>
  count(origin, dest, sort = TRUE)
#The job of mutate() is to add new columns that are calculated from the existing columns.
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60
  )
#By default, mutate() adds new columns on the right-hand side of your dataset, 
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .before = 1
  )
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours,
    .keep = "used"
  )
#select() allows you to rapidly zoom in on a useful subset using operations 
#based on the names of the variables
flights |> 
  select(year, month, day)
#Select all columns between year and day (inclusive):
flights |> 
  select(year:day)
#Select all columns except those from year to day (inclusive):
flights |> 
  select(!year:day)
#Select all columns that are characters:
flights |> 
  select(where(is.character))
# There are a number of helper functions you can use within select():
# starts_with("abc"): matches names that begin with “abc”.
# ends_with("xyz"): matches names that end with “xyz”.
# contains("ijk"): matches names that contain “ijk”.
# num_range("x", 1:3): matches x1, x2 and x3.
# You can rename variables as you select() them by using =.
# The new name appears on the left-hand side of the =, 
# and the old variable appears on the right-hand side:
flights |> 
  select(tail_num = tailnum)
# If you want to keep all the existing variables and just want to rename a few, 
# you can use rename() instead of select():
flights |> 
  rename(tail_num = tailnum)
#Use relocate() to move variables around
#By default relocate() moves variables to the front:
flights |> 
  relocate(time_hour, air_time)
#You can also specify where to put them using the .before and .after arguments, 
#just like in mutate()
flights |> 
  relocate(year:dep_time, .after = time_hour)
flights |> 
  relocate(starts_with("arr"), .before = dep_time)
flights |> select(contains("TIME"))
#imagine that you wanted to find the fastest flights to Houston’s IAH airport: 
#you need to combine filter(), mutate(), select(), and arrange()
flights |> 
  filter(dest == "IAH") |> 
  mutate(speed = distance / air_time * 60) |> 
  select(year:day, dep_time, carrier, flight, speed, dest) |> 
  arrange(desc(speed))
#Use group_by() to divide your dataset into groups meaningful for your analysis
flights |> 
  group_by(month)
#summarize - The most important grouped operation is a summary
flights |> 
  group_by(month) |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE) #ignore missing values
  )
#but one very useful summary is n(), which returns the number of rows in each group
flights |> 
  group_by(month) |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE), 
    n = n()
  )
# There are five handy functions that allow you to extract specific rows within each group:
#   
# df |> slice_head(n = 1) takes the first row from each group.
# df |> slice_tail(n = 1) takes the last row in each group.
# df |> slice_min(x, n = 1) takes the row with the smallest value of column x.
# df |> slice_max(x, n = 1) takes the row with the largest value of column x.
# df |> slice_sample(n = 1) takes one random row.
#You can vary n to select more than one row, or instead of n =, 
#you can use prop = 0.1 to select (e.g.) 10% of the rows in each group. 
flights |> 
  group_by(dest) |> 
  slice_max(arr_delay, n = 1) |>
  relocate(dest)
# slice_min() and slice_max() keep tied values so n = 1 means give us all rows 
# with the highest value. If you want exactly one row per group you can set with_ties = FALSE
daily <- flights |>  
  group_by(year, month, day)
daily
daily_flights <- daily |> 
  summarize(n = n())
daily_flights <- daily |> 
  summarize(
    n = n(), 
    .groups = "drop_last"
  )
daily |> 
  ungroup()
daily |> 
  ungroup() |>
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE), 
    flights = n()
  )
#dplyr treats all the rows in an ungrouped data frame as belonging to one group.
flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE), 
    n = n(),
    .by = month
  )
flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE), 
    n = n(),
    .by = c(origin, dest)
  )
# Data Import
churn <- read.csv("/home/shantanu/Python and Data Science/churn.csv")
head(churn)
students <- read.csv("https://pos.it/r4ds-students-csv")
students
students <- read.csv("https://pos.it/r4ds-students-csv", na = c("N/A", ""))
students |> 
  rename(
    student_id = `Student.ID`,
    full_name = `Full.Name`
  )
#An alternative approach is to use janitor::clean_names() to use 
# some heuristics to turn them all into snake case at once
students |> janitor::clean_names()
# Reading multiple files
sales_files <- c(
  "https://pos.it/r4ds-01-sales",
  "https://pos.it/r4ds-02-sales",
  "https://pos.it/r4ds-03-sales"
)
# Method 1: Using lapply with read.csv (Base R)
# This reads each file and returns a list of data frames
sales_data_list <- lapply(sales_files, read.csv)
sales_data_list
# Method 2: Using lapply and combining into one data frame
# This reads all files and combines them into a single data frame
sales_data_combined <- do.call(rbind, lapply(sales_files, read.csv))
sales_data_combined

# Method 3: Using purrr package (tidyverse approach)
# First install and load purrr if not already installed
# install.packages("purrr")
#install.packages("purrr")
library(purrr)

# Read files using map
sales_data_purrr <- map(sales_files, read.csv)

# Read and combine files using map_dfr
sales_data_combined_purrr <- map_dfr(sales_files, read.csv)
sales_data_combined_purrr

# Method 4: Adding file source identification
# This approach adds a column to identify which file each row came from
sales_data_with_source <- map_dfr(sales_files, ~{
  data <- read.csv(.x)
  data$source_file <- .x
  data
})

# Alternative approach with file names
sales_data_with_names <- map_dfr(set_names(sales_files), read.csv, .id = "file_source")

# Method 5: Using a for loop (more explicit approach)
sales_data_loop <- data.frame()
for(file in sales_files) {
  temp_data <- read.csv(file)
  temp_data$source_file <- file
  sales_data_loop <- rbind(sales_data_loop, temp_data)
}                                 
sales_data_loop

# Method 6: Error handling approach
# This includes error handling in case some files fail to load
safe_read_csv <- function(file) {
  tryCatch({
    data <- read.csv(file)
    data$source_file <- file
    return(data)
  }, error = function(e) {
    cat("Error reading file:", file, "\n")
    cat("Error message:", e$message, "\n")
    return(NULL)
  })
}

sales_data_safe <- map_dfr(sales_files, safe_read_csv)
sales_data_safe

# Display results
cat("Method 1: List of data frames\n")
cat("Number of data frames:", length(sales_data_list), "\n")
cat("Dimensions of each data frame:\n")
for(i in seq_along(sales_data_list)) {
  cat("File", i, ":", dim(sales_data_list[[i]]), "\n")
}

cat("\nMethod 2: Combined data frame\n")
cat("Combined dimensions:", dim(sales_data_combined), "\n")
cat("Column names:", colnames(sales_data_combined), "\n")

cat("\nMethod 3: Using purrr\n")
cat("Number of data frames:", length(sales_data_purrr), "\n")
cat("Combined dimensions:", dim(sales_data_combined_purrr), "\n")

cat("\nMethod 4: With source file identification\n")
cat("Dimensions:", dim(sales_data_with_source), "\n")
cat("Column names:", colnames(sales_data_with_source), "\n")

# Show first few rows of the combined data
cat("\nFirst few rows of combined data:\n")
print(head(sales_data_combined))

# Show summary statistics
cat("\nSummary of combined data:\n")
print(summary(sales_data_combined))

# If you want to access individual data frames from the list:
cat("\nAccessing individual data frames:\n")
cat("First data frame dimensions:", dim(sales_data_list[[1]]), "\n")
cat("Second data frame dimensions:", dim(sales_data_list[[2]]), "\n")
cat("Third data frame dimensions:", dim(sales_data_list[[3]]), "\n")

# Most common use cases:

# 1. If you want separate data frames for each file:
# sales_data_list <- lapply(sales_files, read.csv)

# 2. If you want one combined data frame:
# sales_data_combined <- do.call(rbind, lapply(sales_files, read.csv))

# 3. If you want to track which file each row came from:
# sales_data_with_source <- map_dfr(sales_files, ~{
#   data <- read.csv(.x)
#   data$source_file <- .x
#   data
# })

# 4. Simple one-liner for combining all files:
# sales_data <- do.call(rbind, lapply(sales_files, read.csv))
#Janitor

students |>
  rename(meal_plan = 'mealPlan')
students <- read.csv("https://pos.it/r4ds-students-csv")
students

students <- students |>
  janitor::clean_names() |>
  mutate(
    mealPlan = factor(meal_plan),
    #AGE = parse(if_else(AGE == "five", "5", AGE))
  )
sales_files <- list.files("data", pattern = "sales\\.csv$", full.names = TRUE)
sales_files
write.csv(students, "students.csv")
students
read.csv("students.csv")

tibble(
  x = c(1, 2, 5), 
  y = c("h", "m", "g"),
  z = c(0.08, 0.83, 0.60)
)
tribble(
  ~x, ~y, ~z,
  1, "h", 0.08,
  2, "m", 0.83,
  5, "g", 0.60
)
data("mpg")
View(mpg)
mpg
#visualizing the relationship between displ and hwy for various classes of cars
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy, shape = class)) +
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy, size = class)) +
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy, alpha = class)) +
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "blue")
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_smooth()
ggplot(mpg, aes(x = displ, y = hwy, linetype = drv)) + 
  geom_smooth()
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) + 
  geom_point() +
  geom_smooth(aes(linetype = drv))
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(group = drv))
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color = class)) + 
  geom_smooth()
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_point(
    data = mpg |> filter(class == "2seater"), 
    color = "red"
  ) +
  geom_point(
    data = mpg |> filter(class == "2seater"), 
    shape = "circle open", size = 3, color = "red"
  )
# Left
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 2)

# Middle
ggplot(mpg, aes(x = hwy)) +
  geom_density()

# Right
ggplot(mpg, aes(x = hwy)) +
  geom_boxplot()

library(ggridges)

ggplot(mpg, aes(x = hwy, y = drv, fill = drv, color = drv)) +
  geom_density_ridges(alpha = 0.5, show.legend = FALSE)
#facet_wrap(), which splits a plot into subplots that each display 
#one subset of the data based on a categorical variable
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_wrap(~cyl)
#Setting the scales argument in a faceting function to "free_x" will allow for 
#different scales of x-axis across columns, "free_y" will allow for different 
#scales on y-axis across rows, and "free" will allow both

#https://ggplot2.tidyverse.org/

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(drv ~ cyl, scales = "free")
ggplot(mpg) + 
  geom_point(aes(x = drv, y = cyl))
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(drv ~ .)

ggplot(diamonds, aes(x = cut)) + 
  geom_bar()
#n the code below, we change the stat of geom_bar() from count (the default) 
#to identity. This lets us map the height of the bars to the raw values of a y variable.
diamonds |>
  count(cut) |>
  ggplot(aes(x = cut, y = n)) +
  geom_bar(stat = "identity")
#you might want to display a bar chart of proportions, rather than counts
ggplot(diamonds, aes(x = cut, y = after_stat(prop), group = 1)) + 
  geom_bar()

ggplot(diamonds) + 
  stat_summary(
    aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

ggplot(diamonds, aes(x = cut, y = after_stat(prop), fill = cut)) + 
  geom_bar()
ggplot(diamonds, aes(x = cut, y = after_stat(prop), group = 5)) + 
  geom_bar()

# Left
ggplot(mpg, aes(x = drv, color = drv)) + 
  geom_bar()

# Right
ggplot(mpg, aes(x = drv, fill = drv)) + 
  geom_bar()

ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar()

# Left
ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar(alpha = 1/5, position = "identity")

# Right
ggplot(mpg, aes(x = drv, color = class)) + 
  geom_bar(fill = NA, position = "identity")

#position = "fill" works like stacking, but makes each set of stacked bars the 
#same height. This makes it easier to compare proportions across groups
# Left
ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar(position = "fill")
#position = "dodge" places overlapping objects directly beside one another. 
#This makes it easier to compare individual values.
# Right
ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar(position = "dodge")
#position = jitter spreads the points out instead of overlapping, adding randomness
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(position = "jitter")

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_jitter()

# handling Map data
library(maps)
nz <- map_data("nz")

ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

#coord_quickmap() sets the aspect ratio correctly for geographic maps. 

ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()
#coord_polar() uses polar coordinates.
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = clarity, fill = clarity), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1)

bar + coord_flip()
bar + coord_polar()
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()

# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>, 
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>