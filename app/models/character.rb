class Character < ApplicationRecord
  belongs_to :house

  # ________________
  # familarsList
  # ________________
  # displays a list of familiar animals to use
  def familarsList
    #hash with values as array
    familiarData = File.open("db/seedFiles/familiarData.rb")
  end
end
