class Wand < ApplicationRecord
  belongs_to :character


  # ________________
  # wandList
  # ________________
  # displays a list of familiar animals to use
  # def wandList
  #   # wandData = {}
  #   # File.open("db/seedFiles/wandData.rb") do |file|
  #   #   wandData = eval(file.read)
  #   # end
  #   # @cores = wandData["Cores"]
  #   # @woods = wandData["Wood"]
  #   #hash with values as array
  #
  # end

  def getCores
    wandData = {}
    File.open("db/seedFiles/wandData.rb") do |file|
      wandData = eval(file.read)
    end
    wandData[:Cores]
  end

  def getWoods
    wandData = {}
    File.open("db/seedFiles/wandData.rb") do |file|
      wandData = eval(file.read)
    end
    wandData[:Wood]
  end
end
