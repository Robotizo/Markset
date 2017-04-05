class AdminController < ApplicationController

  def index
  	@total_orders = Order.count
  	@username = User.find(session[:user_id]).name
  end

end
