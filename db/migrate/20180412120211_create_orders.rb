class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :event_id
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
