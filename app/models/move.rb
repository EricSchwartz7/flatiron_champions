class Move < ApplicationRecord
  belongs_to :battle, :character_abilities
end
