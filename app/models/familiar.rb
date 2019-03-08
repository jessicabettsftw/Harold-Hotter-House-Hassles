class Familiar < ApplicationRecord
  has_one :character_familiar

  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 16}, format: {with: /\A[a-z ]+(?: [a-z ]+)?\z/i}

end
