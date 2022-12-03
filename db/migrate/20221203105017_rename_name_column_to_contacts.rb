class RenameNameColumnToContacts < ActiveRecord::Migration[6.1]
  def change
     rename_column :contacts, :name, :title
  end
end
