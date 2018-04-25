class AddSlugToEventTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :event_topics, :slug, :string
  end
end
