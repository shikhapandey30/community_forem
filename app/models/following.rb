class Following < ActiveRecord::Base
 belongs_to :followable, polymorphic: true 
end