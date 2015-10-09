json.array!(@employment_details) do |employment_detail|
  json.extract! employment_detail, :id, :user_id, :total_experience
  json.url employment_detail_url(employment_detail, format: :json)
end
