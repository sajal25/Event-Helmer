class EventTopic < ApplicationRecord
	extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

	has_many :events, dependent: :destroy
end
