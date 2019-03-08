class Character < ApplicationRecord
  has_many :character_spells
  has_many :spells, through: :character_spells
  belongs_to :house
  has_one :wand
  has_one :character_familiar
  has_one :familiar, through: :character_familiar

  has_secure_password

  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 16}, format: {with: /\A[a-z ]+(?: [a-z ]+)?\z/i}
  validates :password, presence: true, length: {minimum: 3, maximum: 16}

  def calculate_points
    count = 0
    self.spells.each do |spell|
      if spell.category == "Curse"
        count -= 30
      else
        count += 10
      end
    end
    count
  end

  def self.most_evil
    evil_spells = []
    Character.all.each do |character|
      num_spells = character.spells.select { |spell| spell.category == 'Curse'}.count
      name = character.name
      evil_spells << {:name => name, :num_spells => num_spells}
    end
    evil_spells.sort_by { |character | character[:num_spells] }.reverse.first
  end

  def self.smartest_student
    evil_spells = []
    Character.all.each do |character|
      num_spells = character.spells.count
      name = character.name
      evil_spells << {:name => name, :num_spells => num_spells}
    end
    evil_spells.sort_by { |character | character[:num_spells] }.reverse.first
  end
end
