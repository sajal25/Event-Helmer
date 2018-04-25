class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :start_datetime
      t.date :end_datetime
      t.string :venue
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.string :cover_image
      t.boolean :is_free
      t.boolean :is_paid

      t.timestamps
    end
  end
end
