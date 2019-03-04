class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :values
      t.string :colors
      t.string :head_of_house
      t.string :founder
      t.string :sigil
      t.string :img_url

      t.timestamps
    end
  end
end
