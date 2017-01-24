class Battle < ApplicationRecord
  has_many :moves
  belongs_to :challenger, class_name: 'Character'
  belongs_to :opponent, class_name: 'Character'

  def battle_move_history
    challenger_moves, opponent_moves = self.moves.partition { |move| CharacterAbility.find(move.character_ability_id).character_id == self.challenger_id}
    [challenger_moves,opponent_moves]
  end

  def render_challenger?
    battle_move_history.first.count == battle_move_history.last.count || battle_move_history.first.count == (battle_move_history.last.count - 1)
  end

  def render_opponent?
    battle_move_history.first.count == battle_move_history.last.count || (battle_move_history.first.count - 1) == battle_move_history.last.count
  end

  def valid_move(character_ability)
    return false if self.battle_over?
    if character_ability.character.id == self.challenger_id
      render_challenger?
    elsif character_ability.character.id == self.opponent_id
      render_opponent?
    else
      false
    end
  end

  def valid_turn(battle_move_history)
    return false if self.moves.blank?
    return battle_move_history.first.count == battle_move_history.last.count
  end

  def attack_challenger(battle_move_history)
    self.challenger_hp -= (calculate_power(battle_move_history.last.last.character_ability.ability.reliability)*((self.opponent.level.to_f/self.challenger.level.to_f)**0.25)).to_i
    self.save
  end

  def attack_opponent(battle_move_history)
    self.opponent_hp -=
     (calculate_power(battle_move_history.first.last.character_ability.ability.reliability)*((self.challenger.level.to_f/self.opponent.level.to_f)**0.25)).to_i
    self.save
  end

  def calculate_power(reliability)
    ((((reliability..10+reliability).to_a) + (((30-reliability..40-reliability)).to_a)).sample/2)
  end

  def end_battle
    challenger = self.challenger
    opponent = self.opponent
    if self.challenger_hp < 1
      self.challenger_hp = 0
    end
    if self.opponent_hp < 1
      self.opponent_hp = 0
    end

    opponent_xp_increase = ((10+self.opponent_hp)*(challenger.level.to_f/opponent.level.to_f).to_f).to_i
    challenger_xp_increase = ((10+self.challenger_hp)*(opponent.level.to_f/challenger.level.to_f)).to_i

    if self.challenger_hp < 1
      self.winner_id = self.opponent.id
      opponent.xp += opponent_xp_increase
      opponent.save
      challenger.xp += challenger_xp_increase/2
      challenger.save

    elsif self.opponent_hp < 1
      self.winner_id = self.challenger.id
      challenger.xp += challenger_xp_increase
      challenger.save
      opponent.xp += opponent_xp_increase/2
      opponent.save

    end
    self.save
  end

  def battle_over?
    !!self.winner_id
  end

  def execute_turn
    attack_challenger(battle_move_history)
    end_battle
    attack_opponent(battle_move_history)
    end_battle
  end


end
