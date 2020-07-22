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
    @upcoming_events = upcoming_events
    @prev_events = prev_events
  end

  def upcoming_events
    filtered_events = []
    @user.event_attendings.each do |event|
      if Event.find(event.attended_event_id).start_date > Date.today
        filtered_events << Event.find(event.attended_event_id)
      end
    end
    filtered_events
  end

  
  def prev_events
    filtered_events = []
    @user.event_attendings.each do |event|
      if Event.find(event.attended_event_id).start_date < Date.today
        filtered_events << Event.find(event.attended_event_id)
      end
    end
    filtered_events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
