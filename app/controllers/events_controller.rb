class EventsController < ApplicationController

  def new

    if session[:user_id].nil?
      redirect_to login_path
    else
      @event = Event.new
    end
  end

  def index
    @events = Event.all
  end

  def create
    
    @event = Event.create(parameters)

    
    @event = User.find(session[:user_id]).created_events.build(location: params[:event][:location])
    

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
  #   params.require(:event).permit(:location)
  # end

end
