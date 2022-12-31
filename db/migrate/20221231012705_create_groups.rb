class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :character_id, null: false
      t.timestamps
    end
  end
end
