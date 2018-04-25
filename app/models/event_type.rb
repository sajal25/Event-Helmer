class EventType < ApplicationRecord
	extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

	has_many :events, dependent: :destroy
  mount_uploader :banner, ImageUploader
end
