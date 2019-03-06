class Character < ApplicationRecord
  has_many :character_spells
  has_many :spells, through: :character_spells
  belongs_to :house
  has_one :wand
  belongs_to :familiar

  validates :name, { presence: true, uniqueness: true, length: {maximum: 16} }
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


end
