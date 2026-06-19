# Define a custom function
def greet(name):
    message = f"Hello, {name}!"
    return message
# Call the function
result = greet("Akshay")
print(result)  # Output: "Hello, Akshay"
#-----------------------------------------------
def calculate_area(length, width):  # length, width are parameters
    area = length * width
    return area  # Return the calculated value

# Function call with arguments
result = calculate_area(5, 3)  # 5, 3 are arguments
print(f"Area: {result}")  # Output: Area: 15

# Function calling another function
def describe_rectangle(l, w):
    area = calculate_area(l, w)  # Calling another function
    return f"Rectangle area is {area} square units"
print(describe_rectangle(4, 6))
#--------------------------------------------------
# Define a reusable function
def calculate_rectangle_area(length, width):
    """Calculate and return the area of a rectangle."""
    area = length * width
    return area

# Use the function multiple times
area1 = calculate_rectangle_area(10, 5)
print(f"Rectangle 1 area: {area1}")

area2 = calculate_rectangle_area(8, 3)
print(f"Rectangle 2 area: {area2}")

area3 = calculate_rectangle_area(12, 6)
print(f"Rectangle 3 area: {area3}")
#-----------temprerature converter---------------------------------
def celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit."""
    fahrenheit = (celsius * 9/5) + 32
    return fahrenheit
print("Celsius to Fahrenheit:", celsius_to_fahrenheit(38))
def fahrenheit_to_celsius(fahrenheit):
    """Convert Celsius to Fahrenheit."""
    celsius = (fahrenheit - 32)*5/9
    return celsius
print("fahreniheit to celsius:", round(fahrenheit_to_celsius(38),2))

# Use in a weather app
today_temp = celsius_to_fahrenheit(25)
print(f"Today's temperature: {today_temp}°F")

# Use in a cooking app
oven_temp = celsius_to_fahrenheit(180)
print(f"Preheat oven to: {oven_temp}°F")

# Use in a science program
water_boiling = celsius_to_fahrenheit(100)
print(f"Water boils at: {water_boiling}°F")
#Lambda functions
add = lambda x, y: x + y
result = add(5, 3)  # Output: 8
print(result)
#--------------------------------------------------
#Recursive function
# Example: Calculate factorial using recursion
def factorial(n):
    # Base case: stop recursion
    if n == 0 or n == 1:
        return 1
    # Recursive case: call itself
    else:
        return n * factorial(n - 1)
# Usage
result = factorial(5)  # 5 * 4 * 3 * 2 * 1 = 120
print(result)  # Output: 120

def main() :
    a = 5
    b = 7
    print(mystery(a, b))
def mystery(x, y):
    z = x+y
    z = z/2.0
    return z 
main() # output 6.0
''' Develop a python function to simulate a dynamic calculator
you need to make the variables and the operators dynamic.
For instance any argument can be passsed for operators to be used and any two variables can be used for the operation
5 +3 = 8, 5*3 = 15, 5/3 = 1.6667, 5**3 = 125, 5-3 = 2'''
# dynamic calculator
def dynacal(x, y, ops):
# using dictionary
    ops = {"+" : add(x,y),
               "-": sub(x,y),
               "*": mul(x,y),
               "**": pow(x,y),
               "\\" : div(x,y)
            }
    return ops
#Alternate, using if statements
'''
    if ops == "+" :
        return add(x,y)
    elif ops == "-":
        return sub(x,y)
    elif ops == "*":
        return mul(x,y)
    elif ops == "**":
        return pow(x,y)
    else:
        return div(x,y)'''
def add(a,b):
    return (a+b)
def sub(a,b):
    if a>b:
        return (a-b)
    else:
        return (b-a)
def mul(a,b):
    return a*b
def div(a,b):
    if b != 0:
        return (a/b)
    else:
        return("Zero divide error")
result = dynacal(5,3, "**")
print(f"result is {result}")

# Alternate way - use get() and operator module
import operator
def dynamic_calculator(a, b, op_string):
    # Map strings to operator functions
    ops = {
        "+": operator.add,
        "-": operator.sub,
        "*": operator.mul,
        "/": operator.truediv,
        "**": operator.pow
    }
        # Retrieve the function and execute
    operation = ops.get(op_string)
    if operation:
        return operation(a, b)
    else:
        return "Invalid Operator"

print(dynamic_calculator(5, 3, "+"))   # 8
print(dynamic_calculator(5, 3, "*"))   # 15
print(dynamic_calculator(5, 3, "/"))   # 1.6666666666666667
print(dynamic_calculator(5, 3, "**"))  # 125
print(dynamic_calculator(5, 3, "-"))   # 2

