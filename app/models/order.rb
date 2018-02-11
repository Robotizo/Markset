class Order < ActiveRecord::Base 
	has_many :line_items, dependent: :destroy	
	belongs_to :user
	has_one :charge
	has_many :payments

	PAYMENT_TYPES = ["Cash", "Card"]
	validates :pay_type, inclusion: PAYMENT_TYPES

	def total_price
		line_items.to_a.sum{|item| item.total_price}
	end



	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			line_items << item
		end
	end
end

