class Order < ApplicationRecord
	belongs_to :event, optional: true
	belongs_to :user, optional: true
	has_many :order_items, dependent: :destroy

	def total 
		self.order_items.map {|oi| oi.price * oi.item_quantity }.sum
	end
end
