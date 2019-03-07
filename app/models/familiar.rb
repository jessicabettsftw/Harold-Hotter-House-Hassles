class Familiar < ApplicationRecord
  has_one :character_familiar
  has_one :character, through: :character_familiar

  def name
    self.character_familiar.name
  end
end
