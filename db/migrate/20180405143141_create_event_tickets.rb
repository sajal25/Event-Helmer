class CreateEventTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :event_tickets do |t|
      t.string :name
      t.integer :available_quantity
      t.integer :price
      t.boolean :is_free
      t.boolean :is_paid
      t.datetime :ticket_sales_start_datetime
      t.datetime :ticket_sales_end_datetime
      t.text :ticket_description
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
