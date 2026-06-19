def make_multiplier(factor):
    # 'factor' is in the enclosing scope
    def multiplier(x):
        return x * factor # Remembers 'factor'
    return multiplier

double = make_multiplier(2)
print(double(5))  # Output: 10 [5, 6]