# Parent Class
class Person:
    def __init__(self, name, surname, number):
        self.name = name
        self.surname = surname
        self.number = number
    
    def display_info(self):
        return f"{self.name} {self.surname} - {self.number}"

# Child Class
class Student(Person):
    # Class attributes
    UNDERGRADUATE, POSTGRADUATE = range(2)
    
    def __init__(self, student_type, *args, **kwargs):
        # Instance attributes
        self.student_type = student_type
        self.classes = []
        # Call parent constructor
        super(Student, self).__init__(*args, **kwargs)
    
    def enrol(self, course):
        self.classes.append(course)
        print(f"{self.name} enrolled in {course}")
    
    def get_student_info(self):
        type_name = "Undergraduate" if self.student_type == 0 else "Postgraduate"
        return f"{self.display_info()} - {type_name}"

# Creating and using a Student object
anisha = Student(Student.UNDERGRADUATE, "Anisha", "Tyagi", "IPMXXXX045")
print(anisha.get_student_info())  # Uses both parent and child methods
anisha.enrol("Python")
anisha.enrol("Data Structures")
print(f"Enrolled courses: {', '.join(anisha.classes)}")