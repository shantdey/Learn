#IPM Mid Term
# ===============================================
# RETAIL SALES ANALYSIS - COMPLETE SOLUTION
# ===============================================

# Given sales data
sales = {
    "North": {
        ("2026-01", "Electronics"): 120000,
        ("2026-03", "Furniture"): 91000,
    },
    "South": {
        ("2026-01", "Electronics"): 98000,
        ("2026-01", "Furniture"): 64000,
        ("2026-03", "Furniture"): 72000,
    },
    "East": {
        ("2026-01", "Electronics"): 76000,
        ("2026-02", "Furniture"): 55000,
        ("2026-03", "Grocery"): 125000,
    },
    "West": {
        ("2026-01", "Electronics"): 110000,
        ("2026-02", "Furniture"): 76000,
        ("2026-03", "Furniture"): 80000,
    }
}

# ===============================================
# Q1: Total Sales for Each Region (10 Marks)
# ===============================================
def total_sales_by_region(sales):
    """
    Loops through each region and sums ALL sales across months/categories
    Returns: {"North": 211000, "South": 234000, ...}
    """
    region_totals = {}
    
    for region, region_data in sales.items():
        region_totals[region] = sum(region_data.values())
        total = 0
        for key, amount in region_data.items():
            total += amount
        region_totals[region] = total
    
    return region_totals

# Test Q1
print(total_sales_by_region(sales))
print("=== Q1: Total Sales by Region ===")
region_totals = total_sales_by_region(sales)
for region, total in region_totals.items():
    print(f"{region}: {total:,}")
print()

# ===============================================
# Q2: Detailed Records + Top 2 Regions (10 Marks)
# ===============================================

print("=== Q2: Detailed Sales Records (Tuple Unpacking) ===")
# Print every record using tuple unpacking
for region, region_data in sales.items():
    for key, amount in region_data.items():
        month, category = key  # Tuple unpacking!
        print(f"{region} | {month} | {category} | {amount:,}")
print()

# Q3A: Top 2 Regions using List Slicing
print("=== Q3A: Top 2 Regions (List Slicing) ===")
# Step 1: Convert Q1 result to list of tuples
regions_list = list(region_totals.items())

# Step 2: Sort by sales (highest first)
regions_sorted = sorted(regions_list, key=lambda x: x[1], reverse=True)

# Step 3: Slice top 2
top_2_regions = regions_sorted[:2]

# Q 4 Q4: Provide code for slicing the below inventory dictionary items into a new dictionary of key
# and value where value < 50    
inventory = {"Laptop": 25, "Mouse": 100, "Keyboard": 50, "Monitor": 15}

# "Slice" items with stock < 50
low_stock = {k: v for k, v in inventory.items() if v < 50}
print("Low stock items:", low_stock)
new_dict = {}
for k, v in inventory.items():
    if v < 50:
        new_dict[k] = v
print(new_dict)

print(dict(sorted(inventory.items(), key = lambda x: x[1])))
for item, infobin inventory.items:
    if info['value'] < 50:
        print(info)

# {'Laptop': 25, 'Monitor': 15}

#Evaluation Rubrics
#Correctness of Solution
#Else Logical Structure 
# print with formatting is provided across all Q- Bonus 1 per 10 marks
# Bonus 1 per 5 marks for good coding practices e.g dictionary comprehension in Q4
#Documentation of steps - Bonus 1 per 10 marks
#adhering to syntax  such as indentation - Bonus 0.5 per 5 marks
