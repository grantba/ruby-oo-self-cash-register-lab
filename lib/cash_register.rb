#require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        self.total = 0
        self.discount = discount
        self.items = []
    end

    def apply_discount
        if self.discount > 0
            self.total = (self.total - (self.total * (self.discount / 100.to_f))) 
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def add_item(item, price, optional_quantity = 1)
        if optional_quantity > 1
            i = 0
            while i < optional_quantity
                self.items << item
                i += 1
            end
        else
            self.items << item
        end
        self.total += (price * optional_quantity)
        self.last_transaction = (price * optional_quantity)
    end

    def void_last_transaction
        self.total -= self.last_transaction
        self.items.pop
        if self.items == []
            return 0.0
        else
            return self.total
        end
    end

#binding.pry
end
