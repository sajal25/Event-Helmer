class AddSlugToEventOrganizers < ActiveRecord::Migration[5.1]
  def change
    add_column :event_organizers, :slug, :string
  end
end
