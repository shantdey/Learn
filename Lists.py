a = [5, 1, 4, 3]
print(sorted(a))  ## [1, 3, 4, 5]
print(a)
strs = ['aa', 'BB', 'zz', 'CC']
print(sorted(strs))  ## ['BB', 'CC', 'aa', 'zz'] (case sensitive)
print(sorted(strs, reverse=True))   ## ['zz', 'aa', 'CC', 'BB']
strs = ['ccc', 'aaaa', 'd', 'bb']
print(sorted(strs, key=len))  ## ['d', 'bb', 'ccc', 'aaaa']

fruits = ['apple', 'banana', 'cherry', 'date', 'elderberry']
# Omit start index (starts from beginning)
print(fruits[:3])    # Output: ['apple', 'banana', 'cherry']
# Omit end index (goes to end)
print(fruits[2:])    # Output: ['cherry', 'date', 'elderberry']
# Omit both indices (creates a copy of entire list)
copy = fruits[:]
print(copy)
print(fruits[:])

# Negative indices (count from end)
print(fruits[-2:])   # Output: ['date', 'elderberry']
#Nested List
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(matrix[0])       # Output: [1, 2, 3] (first sublist)
print(matrix[1][2])    # Output: 6 (row 1, column 2)
# Modifying a sublist
matrix[0][0] = 10
print(matrix)  # Output: [[10, 2, 3], [4, 5, 6], [7, 8, 9]]

# Creating an alias (reference)
list1 = [1, 2, 3]
list2 = list1  # Both point to the same list

list1[0] = 10
print(list2)  # Output: [10, 2, 3] (affected by change)

# Creating a clone (copy)
list1 = [1, 2, 3]
list2 = list1.copy()  # Creates independent copy

list1[0] = 10
print(list2)  # Output: [1, 2, 3] (unchanged)

list1 = [1, 2, 3]
list2 = list1.copy()
print(list1 == list2)
print(list1 is list2)

# enumerate() example
fruits = ['apple', 'banana', 'cherry']
for index, fruit in enumerate(fruits):
    print(f"{index}: {fruit}")
# Starting from a different number
for index, fruit in enumerate(fruits, start=1):
    print(f"{index}: {fruit}")

# filter() example
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Filter even numbers
def is_even(n):
    return n % 2 == 0
even_numbers = list(filter(is_even, numbers))
print(even_numbers)  # Output: [2, 4, 6, 8, 10]

# Using lambda with filter
odd_numbers = list(filter(lambda x: x % 2 != 0, numbers))
print(odd_numbers)  # Output: [1, 3, 5, 7, 9]

# Example 1: Square all numbers
numbers = [1, 2, 3, 4, 5]
def square(x):
    return x ** 2
result = map(square, numbers)
print(list(result))  # Output: [1, 4, 9, 16, 25]
# Example 2: Using lambda with map
numbers = [1, 2, 3, 4, 5]
doubled = map(lambda x: x * 2, numbers)
print(list(doubled))  # Output: [2, 4, 6, 8, 10]
# Example 3: Convert strings to integers
strings = ['1', '2', '3', '4', '5']
integers = map(int, strings)
print(list(integers))  # Output: [1, 2, 3, 4, 5]
#map versus list comprehension
# Using map()
result = list(map(lambda x: x ** 2, [1, 2, 3, 4, 5]))

# Using list comprehension (more Pythonic)
result = [x ** 2 for x in [1, 2, 3, 4, 5]]
from functools import reduce
# Example 1: Sum all numbers
numbers = [1, 2, 3, 4, 5]
total = reduce(lambda x, y: x + y, numbers)
print(total)  # Output: 15
numbers = [5, 2, 8, 1, 9]
maximum = reduce(lambda x, y: x if x > y else y, numbers)
print(maximum)
# Example 3: Multiply all numbers
numbers = [1, 2, 3, 4]
product = reduce(lambda x, y: x * y, numbers)
print(product)
# Using reduce()
from functools import reduce
result = reduce(lambda x, y: x + y, [1, 2, 3, 4, 5])

# Using sum() (more Pythonic for addition)
result = sum([1, 2, 3, 4, 5])

# Basic usage
x = 15
result = "Greater than 20" if x > 20 else "Greater than 10" if x > 10 else "10 or less"
print(result)  # Output: Greater than 10

# Practical example: applying a discount
discount = 0.1
price = 1200
final_price = max(price * (1 - discount), 0) if price > 0 else 0
print(final_price)  # Output: 1080.0