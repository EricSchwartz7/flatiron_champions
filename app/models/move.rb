class Move < ApplicationRecord
  belongs_to :battle
  belongs_to :character_ability
end
