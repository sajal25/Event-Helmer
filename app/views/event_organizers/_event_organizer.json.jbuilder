json.extract! event_organizer, :id, :name, :about, :email, :website, :contact, :address, :created_at, :updated_at
json.url event_organizer_url(event_organizer, format: :json)
