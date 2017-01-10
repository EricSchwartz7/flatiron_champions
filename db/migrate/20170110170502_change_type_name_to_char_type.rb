class ChangeTypeNameToCharType < ActiveRecord::Migration[5.0]
  def change
    rename_column :characters, :type, :char_type
  end
end
