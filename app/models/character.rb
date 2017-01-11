class Character < ApplicationRecord
  belongs_to :user
  has_many :character_abilities
  has_many :abilities, through: :character_abilities
  has_many :battles, through: :character_abilities
  validates :char_type, presence: true
  validates :user_id, presence: true
  extend CreateCharacter

end
