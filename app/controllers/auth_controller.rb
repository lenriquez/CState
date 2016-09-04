class AuthController < ApplicationController
	# TODO: Validate Passwords and email 
	# possible solution to email
	# validates_format_of param:[:email], :with => Devise::email_regexp
	def register
		user = User.create!(email: params[:email], password: params[:password])
		user.confirmed_at = (Time.now.utc + 60.seconds).strftime "%Y-%m-%d %H:%M:%S"
		user.save
		render json: { message: "#{params[:email]} The user has been saved succesfully #{params[:password]}" }
	end

end
