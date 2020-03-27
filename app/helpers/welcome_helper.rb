module WelcomeHelper
  def username
    if logged_in?
      current_user.name
    end
  end

end
