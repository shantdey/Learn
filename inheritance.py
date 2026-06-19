class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary
    def get_info(self):
        return f"{self.name} earns ${self.salary}"
    def work(self):
        return f"{self.name} is working"
class Manager(Employee): # Inherits from Employee
    def __init__(self, name, salary, team_size):
        super().__init__(name, salary) # Reuse parent
        self.team_size = team_size
    def work(self): # Override parent method
        return f"{self.name} is managing {self.team_size} people"
class Developer(Employee):
    def __init__(self, name, salary, language):
        super().__init__(name, salary)
        self.language = language
    def work(self):
        return f"{self.name} is coding in {self.language}"
mgr = Manager("Alice", 95000, 8)
dev = Developer("Bob", 85000,"Python")
print(mgr.get_info()) # Inherited method works!
print(dev.work()) # Overridden method