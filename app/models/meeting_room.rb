class MeetingRoom < ActiveRecord::Base
	 has_one :upload, as: :uploadable, dependent: :destroy
	 accepts_nested_attributes_for :upload, :allow_destroy => true
end
