import time
def brew_tea():
	print("Brewing Tea")
	time.sleep(1)
	print("tea is ready")
brew_tea()

str1 = "hello"
str2 = "world"
str3 = str1.__add__(str2)
print(str3)
new_str = str1.__len__()
new_str

#custom Dunder Method
# regular expressions

import re
str = 'an example word:cat!!'
match = re.search(r'word:\w\w\w', str)
# If-statement after search() tests if it succeeded
if match:
  print('found', match.group()) ## 'found word:cat'
else:
  print('did not find')
 ## Search for pattern 'iii' in string 'piiig'.
  ## All of the pattern must match, but it may appear anywhere.
  ## On success, match.group() is matched text.
match = re.search(r'iii', 'piiig') # found, match.group() == "iii"
if match:
  print('found', match.group()) ## 'found iii'
else:
  print('did not find')
match = re.search(r'igs', 'piiig') # not found, match == None
if match:
  print('found', match.group()) 
else:
  print('did not find')
## . = any char but \n
match = re.search(r'..g', 'piiig') # found, match.group() == "iig"
if match:
  print('found', match.group()) ## 'found iig'
else:
  print('did not find')

 # Repetition
 ## i+ = one or more i's, as many as possible
match = re.search(r'pi+', 'piiig') # found, match.group() == "piii"
print('found', match.group())

## Finds the first/leftmost solution, and within it drives the +
## as far as possible (aka 'leftmost and largest')
## In this example, note that it does not get to the second set of i's
match = re.search(r'i+', 'piigiiii') # found, match.group() == "ii"
print('found', match.group())
## \s* = zero or more whitespace chars
## Here look for 3 digits, possibly separated by whitespace.
match = re.search(r'\d\s*\d\s*\d', 'xx1 2   3xx') # found, match.group() == "1 2   3"
print('found', match.group())
match = re.search(r'\d\s*\d\s*\d', 'xx12  3xx') # found, match.group() == "12  3"
print('found', match.group())
match = re.search(r'\d\s*\d\s*\d', 'xx123xx') # found, match.group() == "123"
print('found', match.group())
## ^ = matches the start of string, so this fails:
## but without the ^ it succeeds:
match = re.search(r'b\w+', 'foobar') 
print('found', match.group())

# Find email address
str = 'deyshant@gmail.com is my mail address'
match = re.search(r'\w+@\w+', str)
if match:
	print(match.group())  ## 'deyshant@gmail'

'''Square brackets can be used to indicate a set of chars, 
so [abc] matches 'a' or 'b' or 'c'. The codes \w, \s etc. work inside square brackets 
too with the one exception that dot (.) just means a literal dot. For the emails problem, 
the square brackets are an easy way to add '.' and '-' to the set of chars which can appear 
around the @ with the pattern r'[\w.-]+@[\w.-]+' to get the whole email address:'''

match = re.search(r'[\w.-]+@[\w.-]+', str)
if match:
	print(match.group())  ## 'deyshant@gmail.com'
# The "group" feature of a regular expression allows you to pick out parts of the matching text. 
''' The "group" feature of a regular expression allows you to pick out parts of the matching text. 
Suppose for the emails problem that we want to extract the username and host separately. 
To do this, add parentheses ( ) around the username and host in the pattern, like this: 
r'([\w.-]+)@([\w.-]+)'. In this case, the parentheses do not change what the pattern will match, 
instead they establish logical "groups" inside of the match text. 
On a successful search, match.group(1) is the match text corresponding to the 
1st left parentheses, and match.group(2) is the text corresponding to the 2nd left parentheses. 
The plain match.group() is still the whole match text as usual.'''
match = re.search(r'([\w.-]+)@([\w.-]+)', str)
if match:
	print(match.group())
	print(match.group(1))
	print(match.group(2))
# findall() is probably the single most powerful function in the re module.
# findall() finds *all* the matches and returns them as a list of strings, 
# with each string representing one match
## Suppose we have a text with many email addresses
str1 = 'deyshant@gmail.com, shant_dey@yahoo.com'
## Here re.findall() returns a list of all the found email strings
emails = re.findall(r'[\w\.-]+@[\w\.-]+', str1)
for email in emails:
	print(email)
'''For files, feed the whole file text into findall() and let it return a list of all the matches in a single step 
 (recall that f.read() returns the whole text of a file in a single string)'''
 # Open file
f = open('data.txt', encoding='utf-8')
 # Feed the file text into findall(); it returns a list of all the found strings
strings = re.findall(r'\w+', f.read())
print(match.group())






