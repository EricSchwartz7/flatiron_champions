class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :challenger_id
      t.integer :opponent_id
      t.integer :winner_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
