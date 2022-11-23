class AddCommentsCountToCustomers < ActiveRecord::Migration[6.1]
  def self.up
    add_column :customers, :comments_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :customers, :comments_count
  end
end
