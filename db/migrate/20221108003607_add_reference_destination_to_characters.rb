class AddReferenceDestinationToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :reference_destination, :text, null: false
  end
end
