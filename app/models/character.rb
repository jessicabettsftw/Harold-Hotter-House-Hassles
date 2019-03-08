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
  # ________________
  # getFamiliars
  # ________________
  # displays a list of familiar animals to use
  def getFamiliars
    familiarData = {}
    File.open("db/seedFiles/familiarData.rb") do |file|
      familiarData = eval(file.read)
    end
    familiarData[:Species]
  end

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
end
