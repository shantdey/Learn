def calculate_total(price, tax_rate):
    # Local variables
    tax = price * tax_rate
    total = price + tax
    print(f"Total: ${total}")
    return total
# Call the function
result = calculate_total(100, 0.08)
# These would cause errors:
#print(tax)    # Error! tax is local to the function
#print(total)  # Error! total is local to the function
def check_total(price, rate):
    total = price + price*rate
    print("total", total)
result1 = check_total(1000, 0.1)
