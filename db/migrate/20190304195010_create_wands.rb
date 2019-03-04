class CreateWands < ActiveRecord::Migration[5.2]
  def change
    create_table :wands do |t|
      t.references :character, foreign_key: true
      t.string :wood
      t.string :length
      t.string :core

      t.timestamps
    end
  end
end
