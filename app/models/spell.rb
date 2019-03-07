class Spell < ApplicationRecord
  has_many :character_spells
  has_many :characters, through: :character_spells

  def learned?(character_id)
    !!CharacterSpell.find_by(character_id: character_id, spell_id: self.id)
  end
end
