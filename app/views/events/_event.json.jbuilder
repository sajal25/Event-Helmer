json.extract! event, :id, :name, :description, :start_datetime, :end_datetime, :venue, :city, :country, :zipcode, :latitude, :longitude, :cover_image, :is_free, :is_paid, :created_at, :updated_at
json.url event_url(event, format: :json)
