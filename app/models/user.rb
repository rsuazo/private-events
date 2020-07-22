class User < ApplicationRecord
  has_secure_password
  
  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendings

  has_many :created_events, foreign_key: :creator_id, class_name: "Event"


  def upcoming_events
    filtered_events = []
    self.event_attendings.each do |event|
      if Event.find(event.attended_event_id).start_date > Date.today
        filtered_events << Event.find(event.attended_event_id)
      end
    end
    filtered_events
  end

  def prev_events
    filtered_events = []
    self.event_attendings.each do |event|
      if Event.find(event.attended_event_id).start_date < Date.today
        filtered_events << Event.find(event.attended_event_id)
      end
    end
    filtered_events
  end


end