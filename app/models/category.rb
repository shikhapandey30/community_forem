class Category < ActiveRecord::Base
	# has_many :categorable_categories,:dependent => :destroy, :as => :categorable
     has_many :categorables
     has_many :users, through: :categorables
end
