class AddBirthDayToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :birth_day, :string
  end
end
