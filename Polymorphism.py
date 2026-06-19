class PaymentMethod:
    def process_payment(self, amount):
        raise NotImplementedError
class CreditCard(PaymentMethod):
    def process_payment(self, amount):
        return f"💳 Charged ${amount} to credit card"
class PayPal(PaymentMethod):
    def process_payment(self, amount):
        return f"🅿️ Sent ${amount} via PayPal"
class Crypto(PaymentMethod):
    def process_payment(self, amount):
        return f"₿ Transferred ${amount} in crypto"
# The magic of polymorphism!
def checkout(payment: PaymentMethod, amount):
# Same function works with ANY payment type
    print(payment.process_payment(amount))
# Usage
checkout(CreditCard(), 99.99)
checkout(PayPal(), 49.99)
checkout(Crypto(), 199.99)