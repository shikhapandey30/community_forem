class Group < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
    has_many :members,:dependent => :destroy, :as => :invitable
    has_one :upload, as: :uploadable, dependent: :destroy
    accepts_nested_attributes_for :upload, :allow_destroy => true

  def self.search(search)
    if search
      where('lower(topic) LIKE ?', "%#{search}%".downcase)

    else
      all
    end
  end

  def img
    if self.upload.try(:image).present?
      self.upload.try(:image)
    else
      'images/gr4.jpg'
    end
  end  

end
