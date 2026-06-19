class BankAccount:
 def __init__(self, owner, balance=0):
    self.owner = owner
    self._balance = balance # "private"

 @property
 def balance(self): # GETTER
     return self._balance # acc.balance

 @balance.setter
 def balance(self, amount): # SETTER
     if amount < 0: # acc.balance = x
         raise ValueError(
 "Balance cannot be negative!")
     self._balance = amount

 @balance.deleter
 def balance(self): # DELETER
     print("Closing account…") # del acc.balance
     self._balance = 0

acc = BankAccount("Alice", 1000)
print(acc.balance) # 1000 ← getter
acc.balance = 500 # ← setter (validates!)
acc.balance = -100 # ← raises ValueError