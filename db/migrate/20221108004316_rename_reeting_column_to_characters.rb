class RenameReetingColumnToCharacters < ActiveRecord::Migration[6.1]
  def change
    rename_column :characters, :reeting, :greeting
  end
end
