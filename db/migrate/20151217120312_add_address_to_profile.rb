class AddAddressToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :address1, :text
  	add_column :profiles, :address2, :text
  end
end
