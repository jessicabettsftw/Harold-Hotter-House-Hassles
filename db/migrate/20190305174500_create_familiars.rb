class CreateFamiliars < ActiveRecord::Migration[5.2]
  def change
    create_table :familiars do |t|
      t.string :species

    end
  end
end
