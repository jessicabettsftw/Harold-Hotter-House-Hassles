class Spell < ApplicationRecord
  has_many :character_spells
  has_many :characters, through: :character_spells

  def learned?(character_id)
    !!CharacterSpell.find_by(character_id: character_id, spell_id: self.id)
  end

  def self.get_rand_spell_effects(spell)
    rand_spells = Spell.all.sample(3)
    rand_spells << spell
    rand_spells.shuffle
  end

  def self.get_unique_category
    categories = []
    Spell.all.collect do |spell|
      included = false
      categories.each do |categoryspell|
        if categoryspell.category == spell.category
          included = true
        end
      end
      if included == false
        categories << spell
      end
    end
    categories
  end
end
