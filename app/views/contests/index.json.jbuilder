json.array!(@contests) do |contest|
  json.extract! contest, :id, :category_id, :topic, :headline, :description, :visibility, :start_date, :end_date, :user_id
  json.url contest_url(contest, format: :json)
end
