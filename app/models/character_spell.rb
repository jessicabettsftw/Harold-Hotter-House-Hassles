class CharacterSpell < ApplicationRecord
  belongs_to :character
  belongs_to :spell

  def name
    Spell.find(self.spell_id).name
  end

  def self.most_common_spell
    spell_count = Hash.new(0)
    CharacterSpell.all.each do |entry|
      spell_count[entry.spell.name] += 1
    end
    key = spell_count.key(spell_count.values.max)
    { :name => key,  :spell => spell_count[key]}
  end
end