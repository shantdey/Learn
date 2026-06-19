## A simulated cash register that tracks the item count and the total amount due.
class CashRegister :
## Constructs a cash register with cleared item count and total.
    def __init__(self) :
        self._itemCount = 0
        self._totalPrice = 0.0
    ## Adds an item to this cash register.
    def addItem(self, price) :
        self._itemCount = self._itemCount + 1
        self._totalPrice = self._totalPrice + price
## Gets the price of all items in the current sale.
    def getTotal(self) :
        return self._totalPrice
## Gets the number of items in the current sale.
    def getCount(self) :
        return self._itemCount
## Clears the item count and the total.
    def clear(self) :
        self._itemCount = 0
        self._totalPrice = 0.0
register1 = CashRegister()
register1.addItem(0.90)
result = register1.getTotal()
print(result)
reg = CashRegister()
reg.addItem(1.95)
reg.addItem(0.95)
reg.addItem(2.50)
print(reg.getCount())
print(reg.getTotal())

## A simulated cash register that tracks the item count and the total amount due.
#
class CashRegister1 :
## Constructs a cash register with cleared item count and total.
# @param taxRate the tax rate to use with this cash register
#
    def __init__(self, taxRate) :
        self._itemCount = 0
        self._totalPrice = 0.0
        self._taxableTotal = 0.0
        self._taxRate = taxRate
## Adds an item to this cash register.
# @param price the price of this item
# @param taxable True if this item is taxable
#
    def addItem(self, price, taxable) :
        self._itemCount = self._itemCount + 1
        self._totalPrice = self._totalPrice + price
        if taxable :
            self._taxableTotal = self._taxableTotal + price
## Gets the price of all items in the current sale.
# @return the total price
#
    def getTotal(self) :
        return self._totalPrice + self._taxableTotal * self._taxRate / 100
## Gets the number of items in the current sale.
# @return the item count
#
    def getCount(self) :
        return self._itemCount
## Clears the item count and the total.
#
    def clear(self) :
        self._itemCount = 0
        self._totalPrice = 0.0
        self._taxableTotal = 0.0
register1 = CashRegister1(7.5)
register1.addItem(3.95, False)
register1.addItem(19.95, True)
print(register1.getCount())
print("Expected: 2")
print("%.2f" % register1.getTotal())
print("Expected: 25.40")