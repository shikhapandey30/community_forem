class Group < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
    has_many :members,:dependent => :destroy, :as => :invitable

    has_one :upload, as: :uploadable, dependent: :destroy
  	accepts_nested_attributes_for :upload, :allow_destroy => true
end
