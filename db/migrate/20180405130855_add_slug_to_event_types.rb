class AddSlugToEventTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :event_types, :slug, :string
  end
end
