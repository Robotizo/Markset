class SessionsController < ApplicationController
	skip_before_action :authorize

  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user.try(:authenticate, params[:password])
  		session[:user_id] = user.id
  		redirect_to store_url
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
    end
 end

  def destroy
  	session[:user_id] = nil
    session[:cart_id] = nil
  	redirect_to store_url, notice: "You have been logged out"
  end

end
