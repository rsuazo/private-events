class Event < ApplicationRecord
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  
  belongs_to :creator, class_name: "User"

  scope :upcoming, ->(date) { where("start_date > ?", date) }

  scope :past, ->(date) { where("start_date < ?", date) }
    
end
