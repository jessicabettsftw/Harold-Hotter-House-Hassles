class CreateCharacterFamiliars < ActiveRecord::Migration[5.2]
  def change
    create_table :character_familiars do |t|
      t.references :character, foreign_key: true
      t.references :familiar, foreign_key: true
      t.string :name

    end
  end
end
