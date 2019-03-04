class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :house, foreign_key: true
      t.string :familiar

      t.timestamps
    end
  end
end
