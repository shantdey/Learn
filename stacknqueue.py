# STACK using a list
stack = []
print("initial stack", stack)
stack.append(10)  # Push 10
print("Added 10 ", stack)
stack.append(20)  # Push 20
print("Added 20 ", stack)
top = stack.pop() # Pop 20 (LIFO) 
print("Pop LIFO", stack)
# Implementing a Stack using a Python list
my_stack = []
# Push items onto the stack
my_stack.append("Plate 1")
my_stack.append("Plate 2")
my_stack.append("Plate 3")
print(f"Stack after pushes: {my_stack}")
# Pop an item off the top
top_plate = my_stack.pop()
print(f"Popped item: {top_plate}")
print(f"Stack after pop: {my_stack}")
print("*******************")
# QUEUE using deque
from collections import deque
queue = deque()
print("initial queue", queue)
queue.append(10)   # Enqueue 10
print("enqueue 10", queue)
queue.append(20)   # Enqueue 20
print("enqueue 20", queue)
front = queue.popleft() # Dequeue 10 (FIFO) 
print("dequeue 10", queue)
print("***************************")
from collections import deque
# Implementing a Queue using deque
my_queue = deque()
# Enqueue items (join the back of the line)
my_queue.append("Alice")
my_queue.append("Bob")
my_queue.append("Charlie")
print(f"Queue after people join: {my_queue}")
# Dequeue an item (first person gets served)
served_person = my_queue.popleft() 
print(f"Served: {served_person}")
print(f"Queue after serving: {my_queue}")
print()
from collections import Counter, namedtuple

# Using Counter 
counts = Counter(['apple', 'banana', 'apple', 'orange'])
print("counts", counts['apple']) # Output: 2

# Using namedtuple [39]
Point = namedtuple('Point', ['x', 'y'])
p = Point(10, 20)
print("point coordinate x", p.x) # Access by name instead of p

print()
# ── Using a plain list as a stack ──────────────────────────

stack = []

# PUSH items onto the stack
stack.append("page 1")   # stack: ['page 1']
print("page", stack)
stack.append("page 2")   # stack: ['page 1', 'page 2']
print("updated page", stack)
stack.append("page 3")   # stack: ['page 1', 'page 2', 'page 3']
print("updated page", stack)

# PEEK — look at the top without removing
print(stack[-1])          # → 'page 3'

# POP — remove the top item (most recent)
print(stack.pop())        # → 'page 3'  stack: ['page 1', 'page 2']
print("page", stack)
print(stack.pop())        # → 'page 2'  stack: ['page 1']
print("page", stack)

# CHECK if empty
print(len(stack) == 0)    # → False
print()
# ❌ NEVER use a list as a queue — it's O(n) disaster
queue = [1, 2, 3]
print(queue)
queue.append(4)
print(queue) # O(1) — fine
queue.pop(0)          # O(n) ← every element shifts left!
# On 1 million items this is catastrophically slow
'''When you call list.pop(0), Python has to slide every remaining element
one slot to the left. That's O(n). For a list with 1 million items,
that's 1 million operations — every single dequeue.'''
'''Always use collections.deque for queues. Both ends are O(1).'''

from collections import deque

# ── The correct way ────────────────────────────────────────
queue = deque()

# ENQUEUE — add to the rear (right end)
queue.append("ticket #001")
queue.append("ticket #002")
queue.append("ticket #003")

print(queue)   # deque(['ticket #001', 'ticket #002', 'ticket #003'])

# DEQUEUE — remove from the front (left end)  O(1)!
print(queue.popleft())   # 'ticket #001'
print(queue.popleft())   # 'ticket #002'

# PEEK at the front
print(queue[0])          # 'ticket #003'

