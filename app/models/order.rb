class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy	


	PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]
	validates :pay_type, inclusion: PAYMENT_TYPES
	validates :name, :address, :email, presence: true

	def total_price
		line_items.to_a.sum{|item| item.total_price}
	end

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id =  nil
			line_items << item
		end
	end
end

