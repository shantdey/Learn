'''A linked list is a sequence of elements called "Nodes." Unlike arrays (or Python lists),
where items are stored right next to each other in the computer's memory,
linked list nodes can be scattered anywhere. Each Node contains two things:
    Data: The actual value being stored.
    Next: A reference (or pointer) to the next node in the sequence.
    The first node is called the Head. If the next reference is None, you've reached the end (the Tail).'''
class Node:
    """A single element in the linked list"""
    def __init__(self, data):
        self.data = data
        self.next = None # By default, it points to nothing

class LinkedList:
    """The overall list manager"""
    def __init__(self):
        self.head = None # The start of the scavenger hunt

    def append(self, data):
        new_node = Node(data)
        if self.head is None:
            # If list is empty, this new node is the head
            self.head = new_node
            return
        
        # Otherwise, travel to the end of the list
        current = self.head
        while current.next:
            current = current.next
        
        # Attach the new node at the end
        current.next = new_node

    def display(self):
        elements = []
        current = self.head
        while current:
            elements.append(str(current.data))
            current = current.next
        print(" -> ".join(elements))

# Using the Linked List
my_list = LinkedList()
my_list.append("Clue 1")
my_list.append("Clue 2")
my_list.append("Clue 3")

my_list.display() # Output: Clue 1 -> Clue 2 -> Clue 3