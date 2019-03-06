class House < ApplicationRecord

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
end
