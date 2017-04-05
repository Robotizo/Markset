class StoreController < ApplicationController
  skip_before_action :authorize

  def index
  	@products = Product.order("created_at DESC")
  	@cart = current_cart
  end
end
