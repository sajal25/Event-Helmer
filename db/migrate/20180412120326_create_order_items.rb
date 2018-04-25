class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.string :item_name
      t.integer :item_quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
