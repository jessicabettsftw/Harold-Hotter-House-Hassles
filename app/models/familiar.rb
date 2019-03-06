class Familiar < ApplicationRecord
  has_one :character, through: :character_familiar

end
