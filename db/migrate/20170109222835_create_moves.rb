class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.integer :battle_id
      t.integer :characterability_id

      t.timestamps
    end
  end
end
