class CharacterAbility < ApplicationRecord
  belongs_to :character
  belongs_to :ability
  has_many :moves
end
