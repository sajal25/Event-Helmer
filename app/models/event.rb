class Event < ApplicationRecord

	extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    paginates_per 6

    has_many :event_tickets, dependent: :destroy
	belongs_to :event_topic, optional: true
	belongs_to :event_organizer, optional: true
	belongs_to :event_type, optional: true
    has_many :orders, dependent: :destroy
    has_many :user_events
    has_many :users, through: :user_events

    accepts_nested_attributes_for :event_tickets, reject_if: :all_blank, allow_destroy: true

	mount_uploader :cover_image, ImageUploader

	geocoded_by :full_address
    after_validation :geocode

    def full_address
     "#{self.venue} #{self.city} #{self.state} #{self.country} #{self.zipcode}"	
    end
end
