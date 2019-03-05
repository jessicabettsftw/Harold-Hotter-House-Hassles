class CreateWands < ActiveRecord::Migration[5.2]
  def change
    create_table :wands do |t|
      t.integer :core_id
      t.integer :wood_id
      t.integer :character_id

    end
  end
end
