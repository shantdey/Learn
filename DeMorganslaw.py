# de Morgan's Law
country = input("Enter the country: ")
city = input("Enter the city: ")
# Compute the shipping cost.
shippingCost = 0.0
if (country != "India" or city =="Mumbai"):
    shippingCost = 200.0
else:
    shippingCost = 100.0
print(shippingCost)
