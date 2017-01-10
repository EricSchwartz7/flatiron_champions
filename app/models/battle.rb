class Battle < ApplicationRecord
  has_many :moves
  belongs_to :challenger, class_name: 'Character'
  belongs_to :opponent, class_name: 'Character'


  def challenger_move?
    !!params[:challenger]
  end

  def it_is_the_users_turn?
    if Battle.find(params[:id]).moves.count == 0
      return true
    else
      challenger_moves, opponent_moves = Battle.find(params[:id]).moves.partition do |move|
        CharacterAbility.find(move.characterability_id).character_id == battle.challenger_id
      end
      if challenger_move?
        challenger_moves.count == opponent_moves.count || challenger_moves.count == opponent_moves.count-1
      else
        challenger_moves.count == opponent_moves.count || challenger_moves.count == opponent_moves.count+1
      end
    end
  end


  def valid_turn
    if Battle.find(params[:id]).moves.count == 0
      return false
    else
      challenger_moves, opponent_moves = Battle.find(params[:id]).moves.partition do |move|
        CharacterAbility.find(move.characterability_id).character_id == battle.challenger_id
      end
      if challenger_moves.count == opponent_moves.count
        [challenger_moves.last, opponent_moves.last]
      else
        false
      end
    end
  end

  def attack_challenger(moves)
    ability = Ability.find(moves.last.ability_id)
    challenger_character = Character.find(moves.first.character_id)
    challenger_charcter.hp -= ability.damage
    challenger_charcter.save
  end

  def end_battle(moves)
    battle = Battle.find(moves.last.battle_id)
    challanger_character = Character.find(moves.first.character_id)
    opponent_character = Character.find(moves.last.character_id)
    if challanger_character.hp < 1
      battle.winner_id = opponent_character
    elsif opponent_character.hp < 1
      battle.winner_id = challanger_character
    end
    battle.save
  end

  def battle_over?
    battle = Battle.find(params[:id])
    !!battle.winner_id
  end

  def attack_opponent(moves)
    ability = Ability.find(moves.first.ability_id)
    opponent_character = Character.find(moves.last.character_id)
    opponent_charcter.hp -= ability.damage
    opponent_charcter.save
  end


  def execute_turn(moves)
    attack_challenger(moves)
    end_battle(moves)
    attack_opponent(moves)
    end_battle(moves)
  end


end
