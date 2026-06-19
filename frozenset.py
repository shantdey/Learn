# From a list (duplicates will be removed)
my_list = [1, 2, 3, 3, 4, 4, 5]
f_set = frozenset(my_list)
print("From list:", f_set)  
# Output: From list: frozenset({1, 2, 3, 4, 5})
# From a string (breaks into unique characters)
f_string = frozenset("hello")
print("From string:", f_string) 
# Output: From string: frozenset({'o', 'h', 'l', 'e'})
# Creating an empty frozenset
empty_fset = frozenset()
print("Empty:", empty_fset)
# Output: Empty: frozenset()