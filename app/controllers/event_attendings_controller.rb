class EventAttendingsController < ApplicationController
  def new
    @event_attending = EventAttending.new
  end

  def create
    @event = Event.find(params[:event_id])

    @event_attending = EventAttending.new(event_attendee_id: params[:user_id], attended_event_id: params[:event_id])

    if @event_attending.save
      redirect_to @event, notice: "Event attended!"
    else
      render 'new', notice: "Oh no, Robert! I was unable to save your post."
    end
  end

end
