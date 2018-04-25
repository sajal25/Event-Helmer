class AddBannerImageToEventTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :event_types, :banner, :string
  end
end
