class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :password_digest
      t.references :house, foreign_key: true

    end
  end
end
