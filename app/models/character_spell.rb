class CharacterSpell < ApplicationRecord
  belongs_to :character
  belongs_to :spell

  def name
    Spell.find(self.spell_id).name
  end
end