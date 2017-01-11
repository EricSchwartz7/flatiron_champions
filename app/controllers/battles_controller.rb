class BattlesController < ApplicationController

  def show
    @battle = Battle.find(params[:id])
    @challenger_character = @battle.challenger
    @opponent_character = @battle.opponent
    @challenger = @challenger_character.user
    @opponent = @opponent_character.user
  end

  def move
    @battle = Battle.find(params[:id])
    @ability_used = CharacterAbility.find(params[:character_ability_id])
    @moves = @battle.battle_move_history
    if @battle.valid_move(@ability_used, @moves)

      @move = Move.create(battle_id: @battle.id, character_ability_id: params[:character_ability_id])
    else
      if @battle.battle_over?
        flash[:notice] = 'You cannot submit a move when the battle is over.'
      else
        flash[:notice] = 'Valid Move Was NOT Submitted or you already made your move.'
      end
      redirect_to battle_path and return
    end
    @battle.execute_turn(@moves) if @battle.valid_turn(@moves)
    redirect_to battle_path
  end


end
