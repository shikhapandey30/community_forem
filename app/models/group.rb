class Group < ActiveRecord::Base
	belongs_to :user
	has_one :upload
	accepts_nested_attributes_for :upload, :allow_destroy => true  
    has_many :members,:dependent => :destroy, :as => :invitable

  def self.search(search)
    if search
      where('topic LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
