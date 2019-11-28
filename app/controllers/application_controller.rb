class ApplicationController < ActionController::Base
  before_action :authorize
  helper_method :current_user
  protect_from_forgery 

  private 
    def current_user 
      User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      user = User.create
      session[:user_id] = user.id
      user
    end

  private 
  	def current_cart 
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end

  protected
  	def authorize
  		unless User.find_by(id: session[:user_id])
  			redirect_to login_url, notice: "Please log in"
  		end
  	end
end
