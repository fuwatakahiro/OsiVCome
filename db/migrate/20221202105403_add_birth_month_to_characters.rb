class AddBirthMonthToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :birth_month, :string
  end
end
