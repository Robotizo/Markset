class SessionsController < ApplicationController
	skip_before_action :authorize

  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user.try(:authenticate, params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
    end
 end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice: "You have been logged out"
  end

  def set_month_view
    session[:month_view] ||= DateTime.new(Time.now.year, Time.now.month, 1, 0, 0, 0, "+00:00")
  end

  def increment_month_view 
    session[:month_view] = session[:month_view] + 1.month
  end

  def decrement_month_view 
    session[:month_view] = session[:month_view] - 1.month
  end
end
