json.array!(@communities) do |community|
  json.extract! community, :id, :category_id, :topic, :headline, :slogan, :community_logo, :description
  json.url community_url(community, format: :json)
end
