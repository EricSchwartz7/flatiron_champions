class CharacterAbility < ApplicationRecord
  belongs_to :character, :ability
  has_many :moves
end
