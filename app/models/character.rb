class Character < ApplicationRecord
  belongs_to :user
  has_many :character_abilities
  has_many :abilities, through: :character_abilities
  validates :char_type, presence: true
  validates :user_id, presence: true
  extend CreateCharacter

  def self.list_characters
    @characters = []

    @ian = Character.new
    @ian.char_type = 'ian'
    @ian.picture_front = 'ian.jpg'
    @characters << @ian

    @j = Character.new
    @j.char_type = 'j'
    @j.picture_front = 'j.jpg'
    @characters << @j

    @jj = Character.new
    @jj.char_type = 'jj'
    @jj.picture_front = 'jj.jpg'
    @characters << @jj

    @tracy = Character.new
    @tracy.char_type = 'tracy'
    @tracy.picture_front = 'tracy.jpg'
    @characters << @tracy

    @antoin = Character.new
    @antoin.char_type = 'antoin'
    @antoin.picture_front = 'antoin.jpg'
    @characters << @antoin

    @characters
  end

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

  def active_invitation
    (self.battles_where_opponent & Battle.where(accepted: nil)).last
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

  def evolve

  end

end
