class AddEventOrganizerToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_organizer_id, :integer
    add_column :events, :event_type_id, :integer
    add_column :events, :event_topic_id, :integer
  end
end
