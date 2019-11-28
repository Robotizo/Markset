class UserMailer < ApplicationMailer
	default from: "Markset User <userservices@markset.com>"

	def signup_confirmation(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to Markset')
	end

	def update_information(user)
		@user = user
		mail(to: @user.email, subject: 'User info has been updated')
	end

	def password_reset(user)
	  @user = user
	  mail(to: @user.email, subject: 'Password Reset')
	end
end

