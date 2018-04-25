class EventOrganizer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

	has_many :events, dependent: :destroy
end
