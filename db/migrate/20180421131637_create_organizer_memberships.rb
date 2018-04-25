class CreateOrganizerMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :organizer_memberships do |t|
      t.integer :event_organizer_id
      t.integer :membership_plan_id
      t.boolean :plan_registered
      t.string :status

      t.timestamps
    end
  end
end
