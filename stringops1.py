string = "James\n"
print(string.rstrip())
# The newline character is stripped from the end of the string
string = "James  \n"
print(string.rstrip()) # blank spaces are trimmed
string = "James \n"
print(string.rstrip("\n")) # only the newline character is stripped (rstrip("chars"))
name = " Mary "
print(name.strip()) # removes white spaces
name = " Mary "
print(name.lstrip()) #white spaces are trimmed only from left

infile = open("/home/shantanu/miniconda3/Thonny/test.txt", "r")
for line in infile :
    print(line)
    # Use the rstrip method to remove the newline character from a line of text.
    print(line.rstrip())
    wordList = line.split()
    print(wordList)
    for word in wordList :
        word = word.rstrip(".,?!") # remove the commas
        print(word, end = " ")
infile.close()
line = "apples:pears:oranges"
#split along :
print()
print(line.split(":"))

string = "a,bc,d"
print(string.split(",") )# The string is split at each comma
string = "a b  c"
'''The string is split using the blank
space as the delimiter. Consecutive
blank spaces are treated as one space.'''
print(string.split())
string = "a b   c"
print(string.split(" "))
''' The string is split using the blank
space as the delimiter. With an
explicit argument, the consecutive
blank spaces are treated as separate
delimiters.'''
text = "Python Programming"

# count() - Count occurrences
print(text.count('o'))  # Output: 2

# islower() - Check if lowercase
print(text.islower())  # Output: False

# split() - Split into list
words = text.split()
print(words)  # Output: ['Python', 'Programming']

# endswith() and startswith()
print(text.endswith('ing'))  # Output: True
print(text.startswith('Py'))  # Output: True

# upper() and lower()
print(text.upper())  # Output: PYTHON PROGRAMMING
print(text.lower())  # Output: python programming

# strip() - Remove whitespace
padded = "  hello  "
print(padded.strip())  # Output: "hello"

# replace() - Replace substring
print(text.replace('Python', 'Java'))  # Output: Java Programming

string1 = "Hello My dear friend"
print(string1.casefold())
text = "  hello world  "

# Formatting methods
print(text.capitalize())  # Output: "  hello world  "
print("python".capitalize())  # Output: "Python"
print("hello".ljust(10, '*'))  # Output: "hello*****"
print(text.lstrip())  # Output: "hello world  "

# Search and replace
email = "user@example.com"
print(email.partition('@'))  # Output: ('user', '@', 'example.com')
print("hello world".replace('world', 'Python'))  # Output: "hello Python"
text1 = "I love python"
print("I love python".replace('python', 'Java'))
# Prefix/suffix removal (Python 3.9+)
url = "https://example.com"
print(url.removeprefix('https://'))  # Output: "example.com"
filename = "document.txt"
print(filename.removesuffix('.txt'))  # Output: "document"

text = "Hello World"

# Search methods
print(text.rindex('o'))  # Output: 7 (last occurrence)
print(text.rpartition(' '))  # Output: ('Hello', ' ', 'World')

# Splitting
print("a-b-c-d".rsplit('-', 2))  # Output: ['a-b', 'c', 'd']
print("line1\nline2\nline3".splitlines())  # Output: ['line1', 'line2', 'line3']

# Padding and stripping
print("hello".rjust(10, '*'))  # Output: "*****hello"
print("  hello  ".rstrip())  # Output: "  hello"
print("42".zfill(5))  # Output: "00042"

# Case transformation
print("Hello".swapcase())  # Output: "hELLO"

# Testing
print("Hello".startswith('He'))  # Output: True

string2 = "United States 303824646"
print(string2.rsplit(" ", 1))
#splits the string into two parts at the first blank space encountered starting from the end of the string