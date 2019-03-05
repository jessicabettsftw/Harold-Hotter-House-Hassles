class Wand < ApplicationRecord
  belongs_to :character
  belongs_to :wood
  belongs_to :core
end
