require 'pry'

class CashRegister
    attr_accessor :total, :discount, :quantity, :items, :subtract_last_item
    attr_reader :title

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += quantity * price

        @items.fill(title, @items.size, quantity)

        self.subtract_last_item = price * quantity
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total *= (100 - discount.to_f)/100
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= self.subtract_last_item
    end
    # binding.pry
end