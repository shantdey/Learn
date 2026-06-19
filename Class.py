class QuadraticFunction:
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c
    def value(self, x):
        return self.a*x**2 + self.b*x + self.c
    def __str__(self):
        return f"{self.a}x^2 + {self.b}x + {self.c}"
    def __call__(self, x):
        return self.value(x)
my_quadratic = QuadraticFunction(1,2,3)
#my_quadratic.value(2)

my_quadratic(2)
my_string="A CaPiTaL MeSs!"
print(my_string.upper())
print(my_string.lower())
help(my_string)
help(str)
# The following code defines a Car class and some methods attached to it.
class Car:
    def __init__(self, model, cost):
        """
        Creates a new Car object.

        Requires

        - `model`:
        - Type: str
        - What: The make and model of the car
        - `cost`:
        - Type: int | float
        - What: The cost of the car
        """
        self.model=model
        self.cost=cost
    def modify_cost(self, amount):
        """
        Modifies the current car object to adjust cost by a provided `amount`

        Adjusts the `cost` variable in place and also returns the updated cost

        Requires

        - `amount`:
        - Type: int | float
        - What: The amount to modify the cost by. Positive increases cost and negative decreases cost.
        """
        self.cost+=amount
help(Car)
my_car=Car(model='Ford F150', cost=11000)
my_car.__dict__
my_car.modify_cost(500)
print(my_car.__dict__)
print(my_car.cost)

