class ChangeCharacterLevelToXp < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:characters, :level, 0)
    add_column :characters, :picture_front, :string
    add_column :characters, :picture_back, :string
    rename_column :characters, :level, :xp

  end
  
end
