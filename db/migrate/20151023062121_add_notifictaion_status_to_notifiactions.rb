class AddNotifictaionStatusToNotifiactions < ActiveRecord::Migration
  def change
    add_column :notifications, :notification_status, :string
    # add_column :sender_id, :notification_status, :string
  end
end
