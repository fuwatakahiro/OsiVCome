class Characters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :greeting, null: false
      t.string :genre, null: false
      t.text :reference_destination, null: false
      t.timestamps null: false
    end
  end
end
