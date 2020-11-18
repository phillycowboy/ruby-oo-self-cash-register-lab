require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(name, price, quantity=1)
        self.total += price * quantity
        quantity.times do 
        @items << name
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        # binding.pry
        if discount != 0 
           difference = self.total * (discount.to_f/100)
            new_total = self.total - difference
            self.total = new_total.to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
        
    end
end