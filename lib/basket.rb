require_relative 'item'

class Basket 


	def initialize
		@items = []
	end

	def items
		@items
	end

 	def item_count
 		@items.count
 	end

 	def accept(item)
 		@items << item
 	end

 	def remove(item)
 		@items.reject! { |x| x if x == item }
 	end

 	def list_items
 		items.map(&:name)
 	end

end