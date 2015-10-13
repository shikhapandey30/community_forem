json.array!(@topics) do |topic|
  json.extract! topic, :id, :forum_id, :user_id, :description, :name
  json.url topic_url(topic, format: :json)
end
