class Node:
    def __init__(self, data):
        self.data = data
        self.next = None   # pointer to next node


class LinkedList:
    def __init__(self):
        self.head = None

    def insert_at_beginning(self, data):
        new_node = Node(data)
        new_node.next = self.head   # new node points to old head
        self.head = new_node        # update head

    def insert_at_end(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            return
        current = self.head
        while current.next:         # traverse till last
            current = current.next
        current.next = new_node

    def traverse(self):
        current = self.head
        while current:
            print(current.data, end=" -> ")
            current = current.next
        print("None")

    def search(self, key):
        current = self.head
        while current:
            if current.data == key:
                return True
            current = current.next
        return False

ll = LinkedList()
ll.insert_at_beginning("fox")
ll.insert_at_beginning("brown")
ll.insert_at_beginning("quick")
ll.insert_at_beginning("the")
ll.insert_at_end("jumps")

ll.traverse()               # the -> quick -> brown -> fox -> jumps -> None
print(ll.search("fox"))     # True
print(ll.search("dog"))     # False
