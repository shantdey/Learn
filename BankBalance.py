'''Problem Statement - write a class that simulates a bank account
users can deposit and withdraw funds. If sufficient funds are not available for withdrawal, a $10
overdraft penalty is charged. At the end of the month, interest is added to the account. The
interest rate can vary every month.'''
#Deposit funds.
#Withdraw funds.
#Add interest.
# We need to be able to find out how much money is in the account.
#Get balance.
#need to supply parameter variables and determine which methods are accessors and mutators
# To deposit or withdraw money, one needs to know the amount of the deposit or withdrawal:
# def deposit(self, amount) :
#def withdraw(self, amount) :
# To add interest, one needs to know the interest rate that is to be applied:
# def addInterest(self, rate) :
"""Clearly, all these methods are mutators because they change the balance.
Finally, we have
def getBalance(self) :
This method is an accessor because inquiring about the balance does not change it."""
# useful to allow for an initial zero balance using a default argument
# Clearly we need to store the bank balance:
# self._balance = initialBalance

#Document the public interface.
## A bank account has a balance that can be changed by deposits and withdrawals.
#
class BankAccount :
## Constructs a bank account with a given balance.
# @param initialBalance the initial account balance (default = 0.0)
#
    def __init__(self, initialBalance = 0.0) :
        self._balance = initialBalance
## Deposits money into this account.
# @param amount the amount to deposit
#
    def deposit(self, amount) :
        self._balance = self._balance + amount
## Makes a withdrawal from this account, or charges a penalty if
# sufficient funds are not available.
# @param amount the amount of the withdrawal
#
    def withdraw(self, amount) :
        PENALTY = 10.0
        if amount > self._balance :
            self._balance = self._balance - PENALTY
        else :
            self._balance = self._balance - amount
## Adds interest to this account.
# @param rate the interest rate in percent
#
    def addInterest(self, rate) :
        amount = self._balance * rate / 100.0
        self._balance = self._balance + amount
## Gets the current balance of this account.
# @return the current balance
# Implement the constructor and methods.
    def getBalance(self) :
        return self._balance
'''Do we need to store the interest rate? No—it varies every month, and is supplied as an argu-
ment to addInterest. What about the withdrawal penalty? The problem description states that
it is a fixed $10, so we need not store it. If the penalty could vary over time, as is the case with
most real bank accounts, we would need to store it somewhere'''
MarysAccount = BankAccount(1000.0)
MarysAccount.deposit(500.0)
# Balance is now $1500
MarysAccount.withdraw(2000.0)
# Balance is now $1490
MarysAccount.addInterest(1.0)
# Balance is now $1490 + 14.90
print("%.2f" % MarysAccount.getBalance())
print("Expected: 1504.90")
   
        

