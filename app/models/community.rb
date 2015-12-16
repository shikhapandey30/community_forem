class Community < ActiveRecord::Base
	belongs_to :user
    has_one :upload, as: :uploadable, dependent: :destroy
    accepts_nested_attributes_for :upload, :allow_destroy => true  
    has_many :members,:dependent => :destroy, :as => :invitable
end
