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

  def active_challenge
    (self.battles_where_challenger & Battle.where(accepted: nil)).last
  end

  def active_invitations
    self.battles_where_opponent & Battle.where(accepted: nil)
  end

  def active_battle
    if !self.battles.blank?
      self.battles.find do |battle|
        battle.winner_id == nil && battle.accepted == true
      end
    end
  end

  def level
    (((self.xp+50)/25)**0.5).to_i
  end

  def destroy_all_invitations
    self.active_invitations.each { |invitation| invitation.destroy }
  end

end
