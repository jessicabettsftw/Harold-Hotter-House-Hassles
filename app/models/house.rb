class House < ApplicationRecord
  has_many :characters
  has_many :spells
  has_many :spells, through: :characters

  def display_values
    length = self.values.length
    values = self.values[1..(length - 2)]
    values = values.gsub('"', '')
  end

  def display_colors
    length = self.colors.length
    colors = self.colors[1..(length - 2)]
    colors = colors.gsub('"', '')
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

  def get_char_points
    char_points = []
    self.characters.each do |character |
      char_points << {:name => character.name, :points => character.calculate_points}
    end
    char_points.sort_by { |character | character[:points] }.reverse
  end

  def self.winning_house
    house_points = []
    self.all.each do |house|
      house_points << {:name => house.name, :points => house.calculate_points}
    end
    house_points.sort_by { |house | house[:points] }.reverse.first
  end
  
end
