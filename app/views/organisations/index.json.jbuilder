json.array!(@organisations) do |organisation|
  json.extract! organisation, :id, :employment_detail_id, :designation, :start_date, :end_date, :current_company, :job_profile
  json.url organisation_url(organisation, format: :json)
end
