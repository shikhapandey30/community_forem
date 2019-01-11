class AddColumnToLike < ActiveRecord::Migration
  def change
  	add_column :likes, :vote, :boolean
  end
end
