class CreateCustomerGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_groups do |t|
      t.integer :group_id, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
