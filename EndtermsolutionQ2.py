from collections import namedtuple, deque

# namedtuple acts as a lightweight blueprint for each order
Order = namedtuple("Order", ["order_id", "customer", "item", "status"])

# Create individual order records
o1 = Order("ORD001", "Priya",  "Cappuccino",  "pending")
o2 = Order("ORD002", "Arjun",  "Sandwich",    "pending")
o3 = Order("ORD003", "Meena",  "Cold Coffee", "served")
o4 = Order("ORD004", "Rohan",  "Muffin",      "pending")

# deque is used as the order queue — fast adds at back, fast removes from front
order_queue = deque([o1, o2, o3, o4])

# New order arrives → add to the back of the queue
order_queue.append(Order("ORD005", "Sneha", "Green Tea", "pending"))

# Counter serves the first customer → remove from the front
served = order_queue.popleft()
print(f"Now serving: {served.customer} — {served.item}")

# Generator function — uses iter() to lazily walk the queue
# and yields only orders that are still pending
def pending_orders(order_queue):
    for order in iter(order_queue):
        if order.status == "pending":
            yield order

# Consume the generator
print("\nPending orders in queue:")
for order in pending_orders(order_queue):
    print(f"  {order.order_id} | {order.customer:<10}| {order.item}")
