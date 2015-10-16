class Category < ActiveRecord::Base
	# has_many :categorable_categories,:dependent => :destroy, :as => :categorable
     has_many :categorable
     has_many :users, through: :categorables
end
