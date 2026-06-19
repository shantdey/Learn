# Basic example with two lists
names = ['Alice', 'Bob', 'Charlie']
ages = [25, 30, 35]
combined = zip(names, ages)
print(list(combined))
# Output: [('Alice', 25), ('Bob', 30), ('Charlie', 35)]
names = ['Alice', 'Bob', 'Charlie']
ages = [25, 30, 35]
# Zip them together
combined = list(zip(names, ages))
print(combined)  # [('Alice', 25), ('Bob', 30), ('Charlie', 35)]
combined = [('Alice', 25), ('Bob', 30)]
# Unzip the tuples back into two separate sequences
names_unzipped, ages_unzipped = zip(*combined)
print(names_unzipped)  # Output: ('Alice', 'Bob')
print(ages_unzipped)   # Output: (25, 30)
# Using zip with three lists
first_names = ['John', 'Jane', 'Jack']
last_names = ['Doe', 'Smith', 'Brown']
ages = [28, 32, 45]
people = zip(first_names, last_names, ages)
for first, last, age in people:
    print(f"{first} {last}, {age} years old")
# When iterables have different lengths
list1 = [1, 2, 3, 4, 5]
list2 = ['a', 'b', 'c']
result = list(zip(list1, list2))
print(result)

data = [
    [6, 7, 8], # Row 0
    [9, 10, 11]  # Row 1
]
print(data)
# Transpose using zip and unpacking
transposed = list(zip(*data))
print(transposed)