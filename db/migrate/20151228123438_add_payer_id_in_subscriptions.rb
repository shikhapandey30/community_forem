class AddPayerIdInSubscriptions < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :payer_id, :integer
  	add_column :subscriptions, :subscribable_id, :integer
  	add_column :subscriptions, :subscribable_type, :string
  end
end
