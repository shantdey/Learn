'''When you open a file in Python, the operating system looks for the file in the directory that
contains your program. This is known as the current working directory. Sometimes it can be
helpful to provide the user of your program with the name of the directory from which input
and output files are going to be accessed. To get the name of the current working directory, use
the function call'''
import os
name = os.getcwd()
print(name)
'''If the data files used by your program are stored in a different directory, such as reports, you
can change the program’s current working directory before opening a file'''
#subdir = "Thonny"
#os.chdir(subdir)
#You can test to see whether a file exists without first opening it.
filename = "inputtext.txt"
if os.path.exists(filename) :
    inputFile = open(filename)
contents = os.listdir()
print(contents)
for filename in contents :
    print(filename)
'''filename = input("Enter data file name: ")
while not os.path.exists(filename) :
    print("Error: invalid file name!")
    filename = input("Enter data file name: ")'''
#os.chdir(dirname)Changes the current working directory.
#os.getcwd()Returns the name of the current working directory.
#os.listdir()
#os.listdir(dirname)Returns a list containing the names of the files and directories in the
#current working directory or the specified directory.
#os.rename(source, dest)Renames a file. The source is renamed to dest.
#os.remove(filename)Deletes an existing file.
#os.path.exists(name)Returns a Boolean indicating whether a file or directory exists.
#os.path.isdir(name)Returns a Boolean indicating if the given name is that of a directory.
#os.path.isfile(name)Returns a Boolean indicating if the given name is that of a file.
#os.path.join(path, name)Returns a string that results from appending a file name to a directory name, including the appropriate path separator.
#shutil.copy(source, dest)Copies the file whose name is given in the string source to the directory or file whose name is given in dest.


