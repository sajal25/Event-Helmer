class EventTicket < ApplicationRecord
  belongs_to :event, optional: true
end
