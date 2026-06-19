import time
start_time = time.time()
def greet_message(Name):
    print(f"Hello: {Name}")
    time.sleep(1)
    print(f"Hello again: Dr. {Name}")
end_time = time.time()
print(f"Task Time: {end_time - start_time} seconds")
greet_message('Albert Einstein')
#cannot reuse
#violates single responsibility
print()
def greet_message1(Name):
    print(f"Hello: {Name}")
    print(f"Hello again: Dr. {Name}")
    return()
#decorator
def timer_decorator(base_function):
    def enhanced_function():
        #before the base function call
        start_time = time.time()
        #base_function() 
        # after the base function call
        end_time = time.time()
        print(f"Task Time: {end_time - start_time} seconds")
    return enhanced_function() #this is part of the decorator
#option 1
#call the decorator and the pass the function we want to decorate as an argument
dec_timer = timer_decorator(greet_message1("Stephen Hawking"))
dec_timer
print()

def shout(func):
    def wrapper():
        result = func()
        return result.upper()
    return wrapper

@shout              # ← sugar for:
def greet():        #   greet = shout(greet)
    return "hello"
print(greet())   # "HELLO"
# @ just means: apply shout to greet
# at definition time
print()
def shout(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return result.upper()
    return wrapper
@shout
def greet(name):
 return f"hello, {name}"
print(greet("alice"))# "HELLO, ALICE"
      
