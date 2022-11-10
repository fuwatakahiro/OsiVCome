class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customer_id, null: false
      t.integer :character_id, null: false
      t.string :character_name, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
