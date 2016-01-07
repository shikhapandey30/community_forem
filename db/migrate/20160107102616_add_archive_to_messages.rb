class AddArchiveToMessages < ActiveRecord::Migration
  def change  	
  	add_column :messages, :by_user, :integer
  end
end
