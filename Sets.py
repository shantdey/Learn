canadian = { "Red", "White" }
british = { "Red", "Blue", "White" }
italian = { "Red", "White", "Green" }
print("Red" in british)
print("White" not in italian)
if canadian.issubset(british) :
    print("Canada was a colony of Britain.")
if not italian.issubset(british) :
    print("Italy was not a colony.")
Students = {"Amish", "Anish", 'Antara', 'Ananya', 'Adrija', 'Abhishek', 'Aakash', 'Ali'}
print(Students)
print(type(Students))
Students.add("Anish")
print(Students)
Students.discard("Amish") # also remove
print(Students)
#Students.clear()
#print(Students)
Students1 = {"Amish", "Anish", 'Antara', 'Ananya', "Vikram", "Vinod", "Ahmed", "Niharika"}
print(Students1)
print(Students == Students1)
print(Students.intersection(Students1))
print(Students.union(Students1))
print(Students.difference(Students1))
print(Students1.difference(Students))
print(len(Students1)) # unique records

