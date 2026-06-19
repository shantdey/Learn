class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner # public
        self.__balance = balance # private!
    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            return f"Deposited ${amount}"
        return "Invalid amount"
    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            return f"Withdrew ${amount}"
        return "Insufficient funds"
    def get_balance(self):
        return self.__balance
#class=class="code-string">"code-comment"># Usage
account = BankAccount("Acme Corp", 10000)
account.deposit(5000) # ✅ Works!
account.__balance = 0  #❌ Can't touch this!
print(account.get_balance()) # 15000