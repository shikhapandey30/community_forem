json.array!(@institutes) do |institute|
  json.extract! institute, :id, :education_history_id, :name, :passing_year
  json.url institute_url(institute, format: :json)
end
