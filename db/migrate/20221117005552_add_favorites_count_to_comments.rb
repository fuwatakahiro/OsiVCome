class AddFavoritesCountToComments < ActiveRecord::Migration[6.1]
  def self.up
    add_column :comments, :favorites_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :comments, :favorites_count
  end
end
