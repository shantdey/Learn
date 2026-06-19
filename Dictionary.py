# Creating a dictionary from two lists
keys = ['name', 'age', 'city']
values = ['Alice', 30, 'New York']
person_dict = dict(zip(keys, values))
print(person_dict)

# Create a dictionary
d = {'A': 100, 'B': 200}
print(d)
# Modify existing value
d['A'] = 400
print(d)  # Output: {'A': 400, 'B': 200}
# Add new entry
d['C'] = 500
print(d)  # Output: {'A': 400, 'B': 200, 'C': 500}
# Copy dictionary
d2 = d.copy()
# Delete entry
del d['B']
print(d)  # Output: {'A': 400, 'C': 500}
# Dictionary Comprehension
# Converting to lists
d = {'A': 100, 'B': 200, 'C': 300}
keys = list(d)              # ['A', 'B', 'C']
values = list(d.values())   # [100, 200, 300]
items = list(d.items())     # [('A', 100), ('B', 200), ('C', 300)]
# Creating dictionary with dict()
d = dict([('A', 100), ('B', 300)])
print(d)  # Output: {'A': 100, 'B': 300}
# Dictionary comprehension
squares = {x: x**2 for x in range(5)}
print(squares)  # Output: {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}
# Creating a dictionary
student = {'name': 'Alice', 'age': 20, 'grade': 'A'}
# Accessing values
print(student['name'])        # Output: Alice
print(student.get('age'))     # Output: 20
print(student.get('email'))   # Output: None (key doesn't exist)
print(student.get('email', 'Not provided'))  # Output: Not provided
# Modifying existing value
student['age'] = 21
print(student)  # Output: {'name': 'Alice', 'age': 21, 'grade': 'A'}
# Adding new key-value pair
student['email'] = 'alice@example.com'
print(student)
# Output: {'name': 'Alice', 'age': 21, 'grade': 'A', 'email': 'alice@example.com'}
# Attempting to add duplicate key (overwrites)
student['age'] = 22  # Overwrites the previous age value
print(student['age'])  # Output: 22

# Creating a nested dictionary
students = { 'student1': {'name': 'Alice','age': 20,'grades': {'math': 85, 'science': 90} },
    'student2': {'name': 'Bob','age': 22,'grades': {'math': 78, 'science': 85}}}
# Accessing nested values
print(students['student1']['name'])  # Output: Alice
print(students['student1']['grades']['science'])  # Output: 90







# Creating a dictionary
student = {'name': 'Alice', 'age': 20, 'grade': 'A', 'active': True}
# len() - Get number of items
print(len(student))  # Output: 4
# str() - String representation
print(str(student))  
# Output: "{'name': 'Alice', 'age': 20, 'grade': 'A', 'active': True}"

# type() - Check type
print(type(student))  # Output: <class 'dict'>

# sorted() - Get sorted keys
print(sorted(student))  
# Output: ['active', 'age', 'grade', 'name']

# any() - Check if any key is True
dict1 = {0: 'zero', 1: 'one', 2: 'two'}
print(any(dict1))  # Output: True (1 and 2 are truthy)

dict2 = {0: 'zero', False: 'false'}
print(any(dict2))  # Output: False (all keys are falsy)

# all() - Check if all keys are True
dict3 = {1: 'one', 2: 'two', 3: 'three'}
print(all(dict3))  # Output: True (all keys are truthy)

dict4 = {0: 'zero', 1: 'one'}
print(all(dict4))  # Output: False (0 is falsy)

#Creating a nested dictionary
students = {
    'student1': {
        'name': 'Alice',
        'age': 20,
        'grades': {'math': 85, 'science': 90}
    },
    'student2': {
        'name': 'Bob',
        'age': 22,
        'grades': {'math': 78, 'science': 85}
    }
}

# Accessing nested values
print(students['student1']['name'])  # Output: Alice
print(students['student1']['grades']['math'])  # Output: 85

#Modifying nested values
students['student1']['age'] = 21
students['student2']['grades']['math'] = 80

# Adding new nested data
students['student3'] = {
    'name': 'Charlie',
    'age': 19,
    'grades': {'math': 92, 'science': 88}
}
print(students)
