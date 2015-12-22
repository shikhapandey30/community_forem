json.array!(@meeting_rooms) do |meeting_room|
  json.extract! meeting_room, :id, :category_id, :topic, :headline, :name, :slogan, :user_id
  json.url meeting_room_url(meeting_room, format: :json)
end
