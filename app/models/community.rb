class Community < ActiveRecord::Base
	belongs_to :user
  has_one :upload, as: :uploadable, dependent: :destroy
  accepts_nested_attributes_for :upload, :allow_destroy => true,  :reject_if => lambda { |c| c[:image].blank? }
  has_many :members,:dependent => :destroy, :as => :invitable
  def self.search(search)
    if search
       where('lower(topic) LIKE ?', "%#{search}%".downcase)
    else
      all
    end
  end
end
