class AddUserIdToSkill < ActiveRecord::Migration
  def change
  	add_column :skills, :user_id, :integer
  end
end
