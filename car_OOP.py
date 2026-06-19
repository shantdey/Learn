# Base Class
class Vehicle:
    def __init__(self, brand, model, year):
        """Initialize common vehicle attributes"""
        self.brand = brand
        self.model = model
        self.year = year
        print(f"Vehicle constructor called: {brand} {model}")
    
    def display_info(self):
        return f"{self.year} {self.brand} {self.model}"

# Subclass
class Car(Vehicle):
    def __init__(self, num_doors, fuel_type, *args, **kwargs):
        """Initialize car-specific attributes, then call parent constructor"""
        # Car-specific attributes
        self.num_doors = num_doors
        self.fuel_type = fuel_type
        
        # Call parent constructor to initialize inherited attributes
        super(Car, self).__init__(*args, **kwargs)
        print(f"Car constructor called: {num_doors} doors, {fuel_type}")
    
    def get_car_details(self):
        return f"{self.display_info()} - {self.num_doors} doors, {self.fuel_type}"

# Creating a Car object
my_car = Car(4, "Gasoline", "Toyota", "Camry", 2023)
print(my_car.get_car_details())