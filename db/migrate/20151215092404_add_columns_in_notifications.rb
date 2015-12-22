class AddColumnsInNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :recepient_id, :integer
  	add_column :notifications, :notificable_id, :integer
  	add_column :notifications, :notificable_type, :string
  	add_column :notifications, :readt_at, :datetime
  	add_column :notifications, :body, :text
  	add_column :notifications, :accept, :boolean, :defualt =>false
  	remove_column :notifications, :notifictaion_type
  	remove_column :notifications, :notification_status
  end
end
