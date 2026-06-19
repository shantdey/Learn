lst = [10, 20, 30]
# next(lst)          # TypeError: 'list' object is not an iterator
it = iter(lst)   # convert iterable -> iterator
print(next(it))  # 10
print(next(it))  # 20
print(next(it))  # 30
# next(it)       # StopIteration

s = "cat"
it = iter(s)
print(next(it))   # 'c'
print(next(it))   # 'a'
print(next(it))   # 't'

numbers = [1, 2, 3, 4]
it = iter(numbers)
while True:
    try:
        n = next(it)
        print(n)
    except StopIteration:
        break
# list comprehension (square brackets)
squares_list = [x * x for x in range(5)]
print(squares_list)
# generator expression (parentheses)
squares_gen = (x * x for x in range(5))
print(squares_gen)
print(next(squares_gen))
print(next(squares_gen))
print(next(squares_gen))
print(next(squares_gen))
#using loop
for value in squares_gen:
    print(value)
# Using generator expression (no big list in memory)
total_gen = sum(x * x for x in range(1_000_000))
