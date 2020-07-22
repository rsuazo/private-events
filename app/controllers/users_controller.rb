class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])

    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    current_user = User.find(params[:id])
    @upcoming_events = current_user.upcoming_events
    @prev_events = current_user.prev_events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
