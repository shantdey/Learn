class Stack:
    def __init__(self):
        self._data = []

    def push(self, item):
        self._data.append(item)

    def pop(self):
        if self.is_empty():
            raise IndexError("Stack is empty — nothing to pop!")
        return self._data.pop()

    def peek(self):
        if self.is_empty():
            raise IndexError("Stack is empty — nothing to peek!")
        return self._data[-1]

    def is_empty(self):
        return len(self._data) == 0

    def size(self):
        return len(self._data)

    def __repr__(self):
        return f"Stack(top → {self._data[::-1]})"


# ── Demo ────────────────────────────────────────────────────
browser_history = Stack()
browser_history.push("google.com")
browser_history.push("wikipedia.org")
browser_history.push("python.org")

print(browser_history)          # Stack(top → ['python.org', 'wikipedia.org', 'google.com'])
print(browser_history.peek())   # python.org   (still there)
print(browser_history.pop())    # python.org   (removed)
print(browser_history.pop())    # wikipedia.org