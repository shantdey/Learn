#Q1
def calculate_final_amount(prices, quantities, is_member, member_tier):
    # prices  : list of float
    # quantities : list of int
    # is_member  : bool
    # member_tier: 'gold', 'silver', or 'bronze'
    # 1. Calculate total using lists
    total = 0.0
    i = 0
    for i in range(len(prices)):
        total = total + prices[i] * quantities[i]
        i = i + 1
    # 2. Nested if for discount logic
    discount_rate = 0.0
    if total > 200:
        if is_member:
            if member_tier == "gold":
                discount_rate = 0.20
            else:
                if member_tier == "silver":
                    discount_rate = 0.10
                else:
                    if member_tier == "bronze":
                        discount_rate = 0.05
                    else:
                        discount_rate = 0.0
        else:
            discount_rate = 0.0
    else:
        discount_rate = 0.0
    # 3. Final amount
    final_amount = total - (total * discount_rate)
    return final_amount
# Example call
prices = [80.0, 100.0, 200.0, 100, 400, 50, 20, 75]
quantities = [2, 1, 1,1, 3, 1,1 ,1 ,1]
amount = calculate_final_amount(prices, quantities, True, "gold")
print("Final amount to pay:", amount)

#Q2
weekly_revenue = [200, 300, 100, 400, 500, 600, 800]
# Saturday is index 5, Sunday is index 6
weekend_sales = weekly_revenue[5:7]
print(weekly_revenue[-2:])
# Sort in ascending order
weekend_sales.sort()
print("Weekend sales:", weekend_sales)   # Output: [700, 800]
print("weekly_revenue:", weekly_revenue[5],weekly_revenue[6])

# A Function should be present - else 1-2 marks deducted
# define paramaters properly
# Initialization of the values
#membership check Boolean
# having a loop, increment counter in the loop
# Representation - proper framing of python syntax and clarity and neatness
# tiered discount structure -  if loop in proper sequence
#passing arguments to the function
#calculating the total value within the loop
#bonuses - print statements with formatting