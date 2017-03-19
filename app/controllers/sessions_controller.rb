class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    unless user
      return redirect_to(controller: 'sessions', action: 'new')
    end

    session[:user_id] = user.id
    redirect_to "/"
  end

  def destroy
  end
end
