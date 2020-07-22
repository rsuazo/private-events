class Event < ApplicationRecord
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  
  
  belongs_to :creator, class_name: "User"

  def future
    if self.start_date > Date.today
      true
    end
  end

  def past
    if self.start_date < Date.today
      true
    end
  end
    
end
