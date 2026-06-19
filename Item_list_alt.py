price_a = input("prices of items")
price_b = price_a.split()
price = list(map(int, price_b))
print(price)
quantity_a = input("quantity of items")
quantity_b =quantity_a.split()
quantity = list(map(int, quantity_b))
print(quantity)
item_value = []
for i in range(len(price)):
    for j in range(len(quantity)):
        if i == j:
            item_value.append(price[i]*quantity[j])
print(item_value)