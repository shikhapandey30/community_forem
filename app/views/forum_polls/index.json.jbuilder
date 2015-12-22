json.array!(@forum_polls) do |forum_poll|
  json.extract! forum_poll, :id, :category_id, :topic, :body, :visibility, :start_date, :end_date
  json.url forum_poll_url(forum_poll, format: :json)
end
