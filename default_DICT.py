from collections import defaultdict

marks = [("Ram", 80), ("Geeta", 90), ("Ram", 85)]
grouped = defaultdict(list)

for name, score in marks:
    grouped[name].append(score)

print(grouped)
# defaultdict(<class 'list'>, {'Ram': [80, 85], 'Geeta': [90]})
