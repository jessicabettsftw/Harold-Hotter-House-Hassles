class CharacterFamiliar < ApplicationRecord
  belongs_to :character
  belongs_to :familiar
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 16}, format: {with: /\A[a-z ]+(?: [a-z ]+)?\z/i}

  def self.most_common_species
    species_count = Hash.new(0)
    self.all.each do |entry|
      species_count[entry.familiar.species] += 1
    end
    key = species_count.key(species_count.values.max)
    { :name => key,  :species => species_count[key]}
  end
end
