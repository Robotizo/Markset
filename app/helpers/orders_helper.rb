module OrdersHelper
	def overall_amount(cart)
    	@cart.total_price.floor+100
	end
end
