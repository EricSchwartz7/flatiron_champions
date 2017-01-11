class Character < ApplicationRecord
  belongs_to :user
  has_many :character_abilities
  has_many :abilities, through: :character_abilities
  validates :char_type, presence: true
  validates :user_id, presence: true
  extend CreateCharacter

  def battles_where_challenger
    Battle.where(challenger_id: self.id)
  end

  def battles_where_opponent
    Battle.where(opponent_id: self.id)
  end

  def battles
    self.battles_where_challenger + self.battles_where_opponent
  end

  def active_battles
    if !self.battles.blank?
      self.battles.select do |battle|
        battle.winner_id == nil
      end
    else
      []
    end
  end

end
