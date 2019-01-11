class RemoveForeignConsFromMessages < ActiveRecord::Migration
  def change
  	remove_foreign_key(:messages, :conversations)
  end
end
