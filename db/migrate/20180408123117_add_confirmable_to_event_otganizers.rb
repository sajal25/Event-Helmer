class AddConfirmableToEventOtganizers < ActiveRecord::Migration[5.1]
  def up
  	add_column :event_organizers, :confirmation_token, :string
    add_column :event_organizers, :confirmed_at, :datetime
    add_column :event_organizers, :confirmation_sent_at, :datetime
    add_column :event_organizers, :unconfirmed_email, :string
    add_index :event_organizers, :confirmation_token, unique: true
    EventOrganizer.all.update_all confirmed_at: DateTime.now
  end
  def down
  	remove_columns :event_organizers, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_column :event_organizers, :unconfirmed_email
  end
end
