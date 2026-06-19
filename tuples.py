# Creating a tuple
coordinates = ("10")
coordinates = (10, 20)
colors = ('red', 'green', 'blue')
mixed = (1, 'hello', 3.14, True)

# Single element tuple (note the comma)
single = (5,)
print("single tuple:", single)
# Empty tuple
empty = ()
print("empty tuple:", empty)
# From an iterable
my_list = [1, 2, 3]
tuple_from_list = tuple(my_list) # (1, 2, 3)
print(tuple_from_list)
my_string = "hello"
tuple_from_string = tuple(my_string) # ('h', 'e', 'l', 'l', 'o')
print(tuple_from_string)
colors = ('red', 'green', 'blue')
print(colors[0])   # Output: red
print(colors[-1])  # Output: blue (last element)
print(colors[1:])  # Output: ('green', 'blue') (slicing)
coordinates = (10, 20)
# coordinates[0] = 15  # This would raise a TypeError! Tuples cannot be modified
# To "change" a tuple, you must create a new one
coordinates = (15, 20)  # Creates a new tuple with updated values
print(coordinates) # Output: (15, 20)
# Creating a tuple
tup2 = (1, 2, 3, 4, 5, 6, 7, 8, 9)

# Basic slicing
print(tup2[1:5])   # Output: (2, 3, 4, 5)

# Using negative indices
print(tup2[-3:])   # Output: (7, 8, 9)
print(tup2[:-2])   # Output: (1, 2, 3, 4, 5, 6, 7)

# Omitting start or end
print(tup2[:4])    # Output: (1, 2, 3, 4)
print(tup2[5:])    # Output: (6, 7, 8, 9)

tupa = (1, 2, [1, 2, 3], 3, 4)
print(tupa)  # Output: (1, 2, [1, 2, 3], 3, 4)

# Modify the list inside the tuple
tupa[2][0] = 99
print(tupa)  # Output: (1, 2, [99, 2, 3], 3, 4)

# But you cannot reassign the tuple element itself
# tupa[2] = [5, 6, 7]  # Error! Tuples are immutable
# Creating a nested tuple
tupa = ('a', 'n', ('anthology'), 'of', (1, 2, 3, 4, 5))
# Accessing elements
print("Tuple:", tupa)
print("First subtuple:", tupa[2])   # Output: anthology
print("Second subtuple:", tupa[4])  # Output: (1, 2, 3, 4, 5)
# Accessing nested values
print("Nested values:", tupa[2][0], tupa[4][2])
# Output: a 3
# More complex nested tuple
coordinates = ((10, 20), (30, 40), (50, 60))

# Accessing nested elements
print(coordinates[0])      # Output: (10, 20)
print(coordinates[0][0])   # Output: 10
print(coordinates[1][1])   # Output: 40

# Iterating through nested tuples
for x, y in coordinates:
    print(f"X: {x}, Y: {y}")
# Creating tuples
t1 = (1, 2, 3)
t2 = (4, 5, 6)

# Concatenation
print(t1 + t2)  # Output: (1, 2, 3, 4, 5, 6)

# Repetition
print(t1 * 3)   # Output: (1, 2, 3, 1, 2, 3, 1, 2, 3)

# Built-in functions
print(len(t2))        # Output: 3
print(max(t1 + t2))   # Output: 6
print(min(t1 + t2))   # Output: 1
print(sum(t2))        # Output: 15

# Membership testing
print(4 in t2)        # Output: True
print(7 in t2)        # Output: False

# Tuple methods
numbers = (1, 2, 3, 2, 4, 2, 5)
print(numbers.index(3))   # Output: 2 (index of first 3)
print(numbers.count(2))   # Output: 3 (2 appears 3 times)

# Tuple packing
coordinates = 10, 20, 30  # Packing values into a tuple
print(coordinates)  # Output: (10, 20, 30)

# Tuple unpacking
x, y, z = coordinates  # Unpacking tuple into variables
print(x)  # Output: 10
print(y)  # Output: 20
print(z)  # Output: 30

# Swapping variables using tuple unpacking
a, b = 5, 10
a, b = b, a  # Swap values
print(a, b)  # Output: 10 5

# Function returning multiple values using tuple packing
def get_user_info():
    name = "Alice"
    age = 30
    city = "New York"
    return name, age, city  # Packing into tuple
result = get_user_info()
print(result)
# Unpacking the returned tuple
user_name, user_age, user_city = get_user_info()
print(f"{user_name}, {user_age}, {user_city}")
# Output: Alice, 30, New York
#variable arguments
def sum_numbers(*args):
    return sum(args)
print(sum_numbers(1, 2, 3))  # Output: 6
print(sum_numbers(10, 20))    # Output: 30 [1, 9]
def print_details(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")
print_details(name="Alice", age=30)
# Tuple sorting
numbers = (5, 2, 8, 1, 9, 3)

# Ascending order (default)
sorted_asc = sorted(numbers)
print(sorted_asc)  # [1, 2, 3, 5, 8, 9]

# Descending order
sorted_desc = sorted(numbers, reverse=True)
print(sorted_desc)  # [9, 8, 5, 3, 2, 1]
# Sorting tuples of tuples
students = (('Alice', 85), ('Bob', 92), ('Charlie', 78))
sorted_students = sorted(students, key=lambda x: x[1])
print(sorted_students)
# [('Charlie', 78), ('Alice', 85), ('Bob', 92)]

# Another example: Calculate statistics
def calculate_stats(numbers):
    """Return min, max, and average of a list."""
    minimum = min(numbers)
    maximum = max(numbers)
    average = sum(numbers) / len(numbers)
    return (minimum, maximum, average)  # Parentheses optional

# Using the function
data = [10, 20, 30, 40, 50]
min_val, max_val, avg_val = calculate_stats(data)
print(f"Min: {min_val}, Max: {max_val}, Avg: {avg_val}")
# Output: Min: 10, Max: 50, Avg: 30.0

# Student grades table
grades = [
    ["Alice", 85, 90, 92],
    ["Bob", 78, 85, 88],
    ["Charlie", 92, 95, 89]
]
# Access specific student's grade
student_name = grades[0][0]  # "Alice"
first_test = grades[0][1]    # 85
# Print all grades for Bob
print(f"{grades[1][0]}'s grades: {grades[1][1:]}")
# Output: Bob's grades: [78, 85, 88]