class Wand < ApplicationRecord
  belongs_to :character
  belongs_to :wood
  belongs_to :core

  def self.most_common_core
    wand_cores = Hash.new(0)
    Wand.all.each do |wand|
      wand_cores[wand.core.material] += 1
    end
    key = wand_cores.key(wand_cores.values.max)
    { :name => key,  :core => wand_cores[key]}
  end

  def self.most_common_wood
    wand_woods = Hash.new(0)
    Wand.all.each do |wand|
      wand_woods[wand.wood.name] += 1
    end
    key = wand_woods.key(wand_woods.values.max)
    { :name => key,  :wood => wand_woods[key]}
  end
end
