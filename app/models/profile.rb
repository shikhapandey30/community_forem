class Profile < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, UserUploader 
	belongs_to :country, :foreign_key => "country"
	# validates_presence_of :first_name,:gender,:dob,:screen_name,:profile_type
    # validates :screen_name, uniqueness: true, :allow_blank => true
end
