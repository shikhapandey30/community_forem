json.array!(@blogs) do |blog|
  json.extract! blog, :id, :name, :description, :image, :user_id, :slug
  json.url blog_url(blog, format: :json)
end
