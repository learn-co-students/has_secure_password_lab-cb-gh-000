class SessionsController < ApplicationController
	def create
		user_params = params[:user]
		@user = User.find_by_name(user_params[:name])
		if @user && @user.authenticate(user_params[:password])
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end
end
