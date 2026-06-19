from abc import ABC, abstractmethod

# Using Abstract Base Classes
class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    
    def area(self):
        return 3.14159 * self.radius ** 2

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        return self.width * self.height

# Checking multiple types with tuple
def process_shape(shape):
    """Process Circle or Rectangle shapes"""
    if isinstance(shape, (Circle, Rectangle)):
        print(f"Shape area: {shape.area()}")
    else:
        raise TypeError("Expected Circle or Rectangle")

# Checking against abstract base class
def calculate_total_area(shapes):
    """Calculate total area of all shapes"""
    total = 0
    for shape in shapes:
        if not isinstance(shape, Shape):
            raise TypeError(f"{shape} is not a Shape")
        total += shape.area()
    return total

# Using type checking in class methods
class ShapeCollection:
    def __init__(self):
        self.shapes = []
    
    def add_shape(self, shape):
        """Add only valid Shape instances"""
        if not isinstance(shape, Shape):
            raise TypeError("Can only add Shape instances")
        self.shapes.append(shape)
    
    @classmethod
    def from_shapes(cls, shape_class, *args):
        """Factory method with class validation"""
        if not issubclass(shape_class, Shape):
            raise ValueError("Must be a Shape subclass")
        collection = cls()
        for arg in args:
            collection.add_shape(shape_class(*arg))
        return collection

# Usage examples
circle = Circle(5)
rectangle = Rectangle(4, 6)

process_shape(circle)  # Works
shapes = [circle, rectangle]
print(f"Total area: {calculate_total_area(shapes)}")