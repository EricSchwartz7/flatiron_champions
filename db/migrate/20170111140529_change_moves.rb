class ChangeMoves < ActiveRecord::Migration[5.0]
  def change
    rename_column :moves, :characterability_id, :character_ability_id
  end
end
