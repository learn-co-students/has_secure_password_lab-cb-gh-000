class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    unless user.save
      return redirect_to action: "new"
    end

    session[:user_id] = user.id
    redirect_to "/"
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
