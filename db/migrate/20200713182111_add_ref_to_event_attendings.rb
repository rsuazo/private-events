class AddRefToEventAttendings < ActiveRecord::Migration[6.0]
  def change

    add_column :event_attendings, :event_attendee_id, :integer
    add_index :event_attendings, :event_attendee_id

    add_column :event_attendings, :attended_event_id, :integer
    add_index :event_attendings, :attended_event_id
  end
end
