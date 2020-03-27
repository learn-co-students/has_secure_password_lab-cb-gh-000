class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to root_path
    else
      redirect_to login_path, alert: 'Name or Password incorrect!'
    end
  end

end
