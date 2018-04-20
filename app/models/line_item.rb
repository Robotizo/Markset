class LineItem < ActiveRecord::Base
	belongs_to :order, optional: true
	belongs_to :product, optional: true
	belongs_to :cart
	belongs_to :charge, optional: true


	def total_price
		product.price * quantity
	end

end
 