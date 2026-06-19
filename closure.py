# Outer function creates a variable
def outer(message):
    # 'message' is a free variable
    def inner():              # inner function
        print(message)        # ← captures 'message'
                              #   from outer scope
    return inner              # returns the function
                              # (NOT the result!)
# outer() finishes — but message is preserved!
greet_hello = outer("Hello!")
greet_bye   = outer("Goodbye!")
greet_hello()   # prints: Hello!
greet_bye()     # prints: Goodbye!
# Each closure has its OWN copy of 'message'
print(greet_hello.__closure__)
print()
def multiplier(n):
    def multiply(x):
        return x * n       # 'n' captured
    return multiply
double = multiplier(2)
triple = multiplier(3)
print(double(5))   # 10
print(triple(5))  # 15
print(double(8))  # 16