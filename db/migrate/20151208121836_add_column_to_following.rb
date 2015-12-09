class AddColumnToFollowing < ActiveRecord::Migration
  def change
    add_column :followings, :followable_id, :integer
    add_column :followings, :followable_type, :string
  end
end
