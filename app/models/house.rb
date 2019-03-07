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
end
