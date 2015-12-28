class AddBody2ToRevealIdentity < ActiveRecord::Migration
  def change
  	add_column :reveal_identities, :body2, :text
  end
end
