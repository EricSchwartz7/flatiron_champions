class Battle < ApplicationRecord
  has_many :moves
  belongs_to :challenger, class_name: 'Character'
  belongs_to :opponent, class_name: 'Character'

  def battle_move_history
    challenger_moves, opponent_moves = self.moves.partition { |move| CharacterAbility.find(move.character_ability_id).character_id == self.challenger_id}
    [challenger_moves,opponent_moves]
  end

  def valid_move(character_ability, battle_move_history)
    return false if self.battle_over?
    if character_ability.character.id == self.challenger_id
      battle_move_history.first.count == battle_move_history.last.count || battle_move_history.first.count == (battle_move_history.last.count - 1)
    elsif character_ability.character.id == self.opponent_id
      battle_move_history.first.count == battle_move_history.last.count || (battle_move_history.first.count - 1) == battle_move_history.last.count
    else
      false
    end
  end

  def valid_turn(battle_move_history)
    return false if self.moves.blank?
    return battle_move_history.first.count == battle_move_history.last.count
  end

  def attack_challenger(battle_move_history)
    challenger_character = Character.find(self.challenger_id)
    challenger_character.hp -= battle_move_history.last.last.character_ability.ability.damage
    challenger_character.save
  end

  def attack_opponent(battle_move_history)
    opponent_character = Character.find(self.opponent_id)
    opponent_character.hp -= battle_move_history.first.last.character_ability.ability.damage
    opponent_character.save
  end

  def end_battle
    @battle = Battle.find(self.id)
    challenger_character = Character.find(self.challenger_id)
    opponent_character = Character.find(self.opponent_id)
    if challenger_character.hp < 1
      @battle.winner_id = opponent_character.id
      #reset_hp
    elsif opponent_character.hp < 1
      @battle.winner_id = challenger_character.id
      #reset_hp
    end
    @battle.save
  end

  def battle_over?
    !!self.winner_id
  end

  def execute_turn(battle_move_history)
    attack_challenger(battle_move_history)
    end_battle
    attack_opponent(battle_move_history)
    end_battle
  end

  # def reset_hp
  #   @battle = Battle.find(self.id)
  #   @battle.challenger.hp = 100
  #   @battle.opponent.hp = 100
  # end


end
