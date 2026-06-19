from collections import namedtuple

Student = namedtuple("Student", ["name", "age", "city"])
s1 = Student("Ram", 21, "Hyderabad")
s2 = Student("Gita", 25, "Indore")
print(s1.name, s1.age)       # Ram 21
print(s2.name, s2.city)
print(s1[0], s1[1])          # also indexable
print(s1._asdict())          # {'name': 'Ram', 'age': 21, 'city': 'Hyderabad'}

s2 = s1._replace(age=22)
print(s2)                    # Student(name='Ram', age=22, city='Hyderabad')
