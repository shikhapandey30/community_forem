class Community < ActiveRecord::Base
	belongs_to :user
    has_one :upload, as: :uploadable, dependent: :destroy

end
