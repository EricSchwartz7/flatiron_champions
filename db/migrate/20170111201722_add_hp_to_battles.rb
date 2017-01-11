class AddHpToBattles < ActiveRecord::Migration[5.0]
  def change
    add_column :battles, :challenger_hp, :integer
    add_column :battles, :opponent_hp, :integer
  end
end
