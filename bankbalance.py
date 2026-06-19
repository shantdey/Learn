class BankAccount:
    def __init__(self, account_number, initial_balance):
        self.__account_number = account_number  # Private attribute
        self.__balance = initial_balance        # Private attribute
    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            return True
        return False
    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            return True
        return False
    def get_balance(self):
        return self.__balance
# Using the encapsulated class
account = BankAccount("12345", 1000)
account.deposit(500)        # ✓ Controlled access
account.withdraw(200)       # ✓ Validated withdrawal
print(account.get_balance()) # ✓ Read-only access
# account.__balance = 9999  # ✗ Cannot access directly!