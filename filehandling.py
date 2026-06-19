infile = open("inputtext.txt", "r")
line = infile.readline()
outfile = open("output.txt", "w") # To open a file for writing
outfile.write("Hello, World!\n")
infile.close()
outfile.close()
'''if a spreadsheet contains descriptive information, such as a title or column headings, you can skip
the row(s) containing that information'''
infile1 = open("movie.csv")
#create a CSV reader using the reader function
from csv import reader
csvReader = reader(infile1)
#next(csvReader)
for row in csvReader :
    print(row)
    year = int(row[1])
    print(year)
    '''Because the data is read and stored as a list of strings, you have to convert numerical data to the
appropriate numerical format before using those values. In our loop, we convert the year value
to an integer before testing it'''
#writing a csv file
outfile = open("newdata.csv", "w")
from csv import writer
'''To add a row of data to the CSV file, use the writerow method. You pass a list of the row’s data
to this method.'''
csvWriter = writer(outfile)
csvWriter.writerow(["Name", "Id", "Class", "Average"])
csvWriter.writerow(["John Smith", 1607, "Senior", 3.28])
# To skip a row in the CSV file, you pass an empty list to the writerow method.
csvWriter.writerow([])
outfile.close()
infile2 = open('newdata.csv')
from csv import reader
csvReader = reader(infile2)
for row in csvReader :
    print(row)
# Open a file in write mode using a context manager
with open("file.txt", "w") as file:
    file.write("To many cooks spoil the broth")
with open("file.txt", "r") as f:
    lines = f.readlines()
    print(lines)
# Open and read entire file read()
file = open("data.txt", "r")
content = file.read()
print(content)
file.close()
# File closes automatically when exiting the 'with' block
# Read file line by line readline()
file = open("data.txt", "r") 
line1 = file.readline()  # First line
print(line1)
line2 = file.readline()  # Second line
print(line2)
line3 = file.readline()  # Third line
file.close()
# Read all lines into a list readlines()
file = open("data.txt", "r")
lines = file.readlines()
for line in lines:
    print(line.strip())
file.close()