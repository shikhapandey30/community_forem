class AddIsAcceptableInNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :is_acceptable, :boolean, :default => false
  end
end
