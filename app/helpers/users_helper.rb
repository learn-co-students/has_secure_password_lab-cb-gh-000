module UsersHelper

  def user_errors
    render 'errors_ul', user: @user if @user.errors.any?
  end
  
end
