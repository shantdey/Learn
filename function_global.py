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