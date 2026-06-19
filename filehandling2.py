'''There are two methods for reading an entire file. The call inputFile.read() returns a string with
all characters in the file. The readlines method reads the entire contents of a text file into a list:'''
inputFile = open("inputtext.txt", "r")
listOfLines = inputFile.readlines()
inputFile.close()
'''Each element in the list returned by the readlines method is a string containing a single line
from the file (including the newline character). Once the contents of the file are in the list,
you can access lines in the list by position, as in listOfLines[2]. You can also iterate over the
entire list'''
for line in listOfLines :
    text = line.rstrip()
    print(text)
'''useful for small files, avoid using them for large files because they can require a large amount of memory
to store all of the strings'''

