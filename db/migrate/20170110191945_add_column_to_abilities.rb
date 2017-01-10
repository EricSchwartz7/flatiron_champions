class AddColumnToAbilities < ActiveRecord::Migration[5.0]
  def change
    add_column :abilities, :char_type, :string
  end
end
