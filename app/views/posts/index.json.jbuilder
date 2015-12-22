json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :category_id, :topic, :post_text, :attachment, :visibility, :expiration_date
  json.url post_url(post, format: :json)
end
