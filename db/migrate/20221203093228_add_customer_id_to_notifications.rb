class AddCustomerIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :customer_id, :integer
  end
end
