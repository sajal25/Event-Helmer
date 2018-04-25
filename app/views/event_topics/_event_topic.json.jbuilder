json.extract! event_topic, :id, :name, :description, :created_at, :updated_at
json.url event_topic_url(event_topic, format: :json)
