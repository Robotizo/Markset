class AdminController < ApplicationController

  def index

  	@user = current_user
  	@userAdmin = User.find_by_id(params = 1)
  	@total_orders = Order.count
  	@orders = Order.all.order("created_at DESC")


  	unless current_user == @userAdmin
      flash[:notice] = "You don't have access to admin!"
      redirect_to store_path
      return
    end
    
  end
end
