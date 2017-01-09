class Ability < ApplicationRecord
  has_many :character_abilities
  has_many :characters, through: :character_abilities
  has_many :battles, through: :character_abilities
end
