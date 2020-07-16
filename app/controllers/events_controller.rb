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
    @event = User.find(session[:user_id]).created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event Created, Robert! Your event was successfully saved!"
    else
      render 'new', notice: "Oh no, Robert! I was unable to save your post."
    end
  end

  def update
    @event = Event.find(params[:id]).update(event_params)
    
    redirect_to event_path
  end

  def show
    @event = Event.find(params[:id])
    @event_attendings = EventAttending.new
    @attendees = @event.attendees.all
  end

  private

  def event_params
    params.require(:event).permit(:location, :start_date)
  end

end
