class CreateEventOrganizers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_organizers do |t|
      t.string :name
      t.text :about
      t.string :email
      t.string :website
      t.string :contact
      t.string :address

      t.timestamps
    end
  end
end
