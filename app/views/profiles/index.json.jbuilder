json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :user_id, :gender, :image, :phone_no, :location, :dob, :screen_name, :specialization_id, :street, :post_code, :city, :country
  json.url profile_url(profile, format: :json)
end
