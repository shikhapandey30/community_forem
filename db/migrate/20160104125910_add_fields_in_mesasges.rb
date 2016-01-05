class AddFieldsInMesasges < ActiveRecord::Migration
  def change
  	add_column :messages, :is_read, :boolean, :default => false
  	add_column :messages, :read_at, :datetime
  end
end
