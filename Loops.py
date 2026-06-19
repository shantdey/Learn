year = 0
balance = 10000

while balance < 20000:
    year += 1
    interest = balance * 0.05
    balance += interest
print(f"Years to double: {year}")
balance = 10000
for year in range(1,16):
    year +=1
    interest = balance*0.05
    balance += interest
print(f"Balance is: {balance: .2f}")




for i in range(1, 4):  # Outer loop: i iterates from 1 to 3
    for j in range(1, 3):  # Inner loop: j iterates from 1 to 2
        print(f"{i} x {j} = {i*j}")