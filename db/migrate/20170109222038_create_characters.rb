class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :type
      t.integer :level, default: 1
      t.integer :hp, default: 100
      t.integer :user_id

      t.timestamps
    end
  end
end
