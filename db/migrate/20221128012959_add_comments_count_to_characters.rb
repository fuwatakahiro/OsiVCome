class AddCommentsCountToCharacters < ActiveRecord::Migration[6.1]
  def self.up
    add_column :characters, :comments_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :characters, :comments_count
  end
end
