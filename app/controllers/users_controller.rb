class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # binding.pry
      render '/users/new'
    end
  end

  private

  def user_params
    params[:user].permit(:name, :password, :password_confirmation)
  end

end
#
#
# it "creates a new user" do
#   post :create, user: steven
#   expect(User.last.name).to eq('Steven')
# end
#
# it "logs you in" do
#   post :create, user: steven
#   expect(session[:user_id]).to eq(User.last.id)
# end
#
# it "sets your password if the confirmation matches" do
#   post :create, user: steven
#   expect(User.last.authenticate(steven[:password])).to eq(User.last)
# end
#
# it "redirects you if your password and confirmation don't match" do
#   typo = steven.merge(password_confirmation: 'uni111verse')
#   post :create, user: typo
#   expect(response).to redirect_to(controller: 'users', action: 'new')
# end
# end
# end
