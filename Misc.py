def countdown(n):
    if n <= 0:
        print('Blastoff!')
    else:
        print(n)
        countdown(n-1)
countdown(10)
# A function that calls itself is recursive;
#the process of executing it is called recursion.

# Lists
HarryPotter_Friend = ["Dobby", "Hermione", "Ron Weasley", "Neville Longbottom", "Fred Weasley", "George Weasley"]
print("old frield list:", HarryPotter_Friend)
Harry_Professors = ["Prof. Snape", "Prof. McGonagol", "Prof. Dumbledore", "Prof. Sprout"]
HarryPotter_Friend.append("Sirius Black")
print("updated friend list:", HarryPotter_Friend)
HarryPotter_Friend.pop()
print("further updated friend list:", HarryPotter_Friend)
HarryPotter_Friend.extend(Harry_Professors)
print("further updated friend list:", HarryPotter_Friend)
HarryPotter_Friend.insert(0,"Gini Weasley")
print("further updated friend list:", HarryPotter_Friend)
#check if a value exists
print("Index of Neville:",HarryPotter_Friend.index("Neville Longbottom"))
print("Prof. Snape" in HarryPotter_Friend)
HarryPotter_Friend.sort()
print("Sorted friend list:", HarryPotter_Friend)
NumLuck = [20, 9, 11, 8]
NumLuck.sort( reverse = True)
print(NumLuck)
HP_friends = HarryPotter_Friend.copy()
print(HP_friends)