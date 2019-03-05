class CreateCharacterSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :character_spells do |t|
      t.references :character, foreign_key: true
      t.references :spell, foreign_key: true

    end
  end
end
