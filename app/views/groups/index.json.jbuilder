json.array!(@groups) do |group|
  json.extract! group, :id, :category_id, :topic_id, :headline, :description, :image, :video, :site_link, :file, :topic
  json.url group_url(group, format: :json)
end