## Models a tally counter whose value can be incremented, viewed, or reset.
#
class Counter :
## Gets the current value of this counter.
# @return the current value
#
    def getValue(self) :
        return self._value
## Advances the value of this counter by 1.
#
    def click(self) :
        self._value = self._value + 1
    ## Resets the value of this counter to 0.
#
    def reset(self) :
        self._value = 0

# This program demonstrates the Counter class.
# Import the Counter class from the counter module.
#from counter import Counter
tally = Counter()
tally.reset()
tally.click()
tally.click()
result = tally.getValue()
print("Value:", result)
tally.click()
result = tally.getValue()
print("Value:", result)