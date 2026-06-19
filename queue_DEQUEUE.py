from collections import deque, Counter, namedtuple

Task = namedtuple("Task", ["user", "description", "priority"])

class TaskManager:
    def __init__(self):
        self._queue = deque()        # FIFO queue of tasks

    def add_task(self, task):
        self._queue.append(task)

    def next_task(self):
        if not self._queue:
            return None
        return self._queue.popleft()

    def stats_by_user(self):
        return Counter(t.user for t in self._queue)

tm = TaskManager()
tm.add_task(Task("Ram", "Grade assignments", 1))
tm.add_task(Task("Geeta", "Prepare slides", 2))
tm.add_task(Task("Ram", "Meet students", 2))

print(tm.stats_by_user())        # Counter({'Ram': 2, 'Geeta': 1})
print(tm.next_task())            # first task in
print(list(tm._queue))           # remaining tasks

from collections import Counter

words = ["data", "ai", "data", "python", "ai", "data"]
freq = Counter(words)

print(freq)              # Counter({'data': 3, 'ai': 2, 'python': 1})
print(freq["data"])      # 3
print(freq.most_common(2))  # [('data', 3), ('ai', 2)]
