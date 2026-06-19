# Global variable
x = "global"

def my_function():
    # Local variable
    x = "local"
    print(x)  # Prints: local

my_function()
print(x)      # Prints: global
#------------------------
# Built-in scope (always available)
print("Hello")  # print() is built-in
result = len([1, 2, 3])  # len() is built-in
# Global scope
global_var = 100
def my_function():
    print(global_var)  # Can read global variable
    print(len("test"))  # Can use built-in functions
my_function()
#-------Global versus Local
balance = 10000  # A global variable
def withdraw(amount):
    global balance  # Declare we're using the global variable
    balance = balance - amount
def deposit(amount):
    global balance
    balance = balance + amount
# Using the functions
withdraw(500)
print(balance)  # Output: 9500
deposit(1000)
print(balance)  # Output: 10500
#------------------------------------
#Same variable name in multiple functions
def main():
    result = square(3) + square(4)
    print(result)  # Output: 25
def square(n):
    result = n * n
    return result
#--------------------------------
#Loop variable scope
main()
def main():
    sum = 0
    for i in range(11):
        square = i * i
        sum = sum + square
    print(i)      # Output: 10
    print(sum)    # Output: 385
main()
#---Nonlocal
def outer_function():
    # Enclosing scope variable
    enclosingvar = "I'm in enclosing scope"
    print("Outer:", enclosingvar)
    
    def inner_function():
    # Can access enclosing variable      
    # To modify, need nonlocal keyword
    #print(enclosingvar)
        nonlocal enclosingvar
        enclosingvar = "Modified"
    inner_function()
    print("Inner:", enclosingvar)

outer_function()
# Local Scope
def calculate_total(price, tax_rate):
    # Local variables
    tax = price * tax_rate
    total = price + tax
    print(f"Total: ${total}")
    return total

# Call the function
result = calculate_total(100, 0.08)

# These would cause errors:
# print(tax)    # Error! tax is local to the function
# print(total)  # Error! total is local to the function

# But we can use the returned value:
print(f"Result: ${result}")  # Works!

# LEGB Demonstration
# Built-in scope: print, len (always available)
# Leg B4 (Not LBW)
# Global scope
global_var = "I'm global"

def outer_function():
    # Enclosing scope
    enclosing_var = "I'm enclosing"
    
    def inner_function():
        # Local scope
        local_var = "I'm local"
        
        # Access all scopes
        print(local_var)       # Local
        print(enclosing_var)   # Enclosing
        print(global_var)      # Global
        print(len(local_var))  # Built-in
    
    inner_function()
    # print(local_var)  # Error! Not accessible here

outer_function()
#----------------------------------------------
# Global variables
counter = 0  # Global variable
# Without global keyword (creates local variable)
def increment_wrong():
    counter = counter + 1  # Error! Local variable referenced before assignment
# With global keyword (modifies global variable)
def increment_correct():
    global counter
    counter += 1   # Works! Modifies global variable
increment_correct()
print(counter)  # Output: 1
def Call_global():
    print("counter", counter)
Call_global()


#----Global-Local
x = "global"  # Global variable

def my_function():
    x = "local"  # Local variable shadows the global one
    print(f"Inside function: {x}")  # Prints: local

my_function()
print(f"Outside function: {x}")  # Prints: global

# The global variable x is unchanged