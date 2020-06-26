class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])

    redirect_to @user
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  

  def show
    @user = User.find(params[:id])
  end
end
