class CreateEventTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :event_topics do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
