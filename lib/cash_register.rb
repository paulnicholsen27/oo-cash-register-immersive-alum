require 'pry'

class CashRegister
	attr_accessor :total, :discount, :last_transaction, :items, :last_transaction

	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
		@last_transaction = nil
	end

	def add_item(name, price, quantity=1)
		@last_transaction = {"name": name, "price": price, "quanity": quantity}
		@total += (price * quantity)
		quantity.times{ |i| @items << name }

	end

	def void_last_transaction
		name = @last_transaction[:name]
		price = @last_transaction[:price]
		quantity = @last_transaction[:quanity]
		@total -= (price * quantity)
		quantity.times{ |i| @items.delete_at(@items.index(name)) }

	end

	def apply_discount
		if @discount != 0
			@total *= (1 - @discount / 100.0)
			@total = @total.to_i
			return "After the discount, the total comes to $#{@total}."
		else
			return "There is no discount to apply."
		end
	end
end