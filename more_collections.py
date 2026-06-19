from collections import deque

q = deque()
q.append("bird")    # enqueue at rear
print(q)
q.append("dog")
print(q)
q.append("cat")
print(q)

q.popleft()         # dequeue → "bird"
print(q)
q[0]                # peek front → "dog"
print(q[0])

# Fixed-size sliding window:
recent = deque(maxlen=3)
for x in [1, 2, 3, 4, 5]:
    recent.append(x)
# deque([3, 4, 5], maxlen=3)
print(recent)