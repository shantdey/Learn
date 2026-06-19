def read_data():
    for i in range(100):
        yield i

def filter_even(numbers):
    for n in numbers:
        if n % 2 == 0:
            yield n

def square(numbers):
    for n in numbers:
        yield n ** 2

# Chain generators together
pipeline = square(filter_even(read_data()))
result = list(pipeline)  # [0, 4, 16, 36, ...]
print(result)