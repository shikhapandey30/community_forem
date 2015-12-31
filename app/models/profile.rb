class Profile < ActiveRecord::Base

	## Model Associations
	belongs_to :user
	belongs_to :contry, class_name: "Country", :foreign_key => "country"

	## Image uploading
	mount_uploader :image, UserUploader
	
	# validates_presence_of :first_name,:gender,:dob,:screen_name,:profile_type
  # validates :screen_name, uniqueness: true, :allow_blank => true

  def country
  	self.contry
  end
end
