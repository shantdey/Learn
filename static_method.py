class Temperature:
    def __init__(self, celsius):
        self.celsius = celsius

    @staticmethod
    def celsius_to_fahrenheit(c):
        return (c * 9/5) + 32     # no self, no cls

    @staticmethod
    def is_valid_temp(c):
        return -273.15 <= c <= 1_000_000

    def display(self):
        f = Temperature.celsius_to_fahrenheit(
                self.celsius)
        print(f"{self.celsius}°C = {f}°F")

# Call on the CLASS (no instance needed):
Temperature.celsius_to_fahrenheit(100)  # 212.0
Temperature.is_valid_temp(-300)         # False

# Also works on an instance:
t = Temperature(37)
t.celsius_to_fahrenheit(37)   # 98.6
t.display()                   # 37°C = 98.6°F