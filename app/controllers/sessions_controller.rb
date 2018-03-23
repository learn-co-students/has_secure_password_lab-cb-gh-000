require 'pry'
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to homepage_path, alert: "You have logged in succesfully"
    else
      redirect_to login_path, alert: "the name or password is incorrect"
    end
  end

end
