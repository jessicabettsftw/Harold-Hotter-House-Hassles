class CreateSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :type
      t.string :effect

      t.timestamps
    end
  end
end
