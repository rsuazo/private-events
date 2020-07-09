class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create

    # def current_user
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end
    # helper_method :current_user

    # def create
    #   @user = User.find_by_email(params[:email])
    #   if @user && @user.authenticate(params[:password])
    #     session[:user_id] = @user.id
    #     redirect_to user_path(@user.id), notice: "Logged in!"
    #   else
    #     flash.now.alert = "Email or password is invalid"
    #     render "new"
    #   end
    # end

    # @event = Event.new(event_params)
    @event = Event.create(location: params[:event][:location], creator_id: current_user.id)

    if @event.save
      redirect_to @event, notice: "Event Created, Robert! Your event was successfully saved!"
    else
      render 'new', notice: "Oh no, Robert! I was unable to save your post."
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  # def event_params
  #   params.require(:event).permit(:location, :creator_id)
  # end

end
