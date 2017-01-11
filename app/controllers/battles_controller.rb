class BattlesController < ApplicationController
  def new
    @users = User.where("id != ?", current_user.id)
    @battle = Battle.new

  end

  def create
    @opponent_character = User.find(params[:battle][:opponent_id]).characters.first
    @battle = Battle.new(challenger_id: current_user.characters.first.id, opponent_id: @opponent_character.id)
    unless @opponent_character.active_battles.blank?
      flash[:notice] = "That user has an ongoing battle. Please choose another opponent."
      redirect_to new_battle_path
    else
      @battle.save
      redirect_to @battle
    end

  end

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
    @moves = @battle.battle_move_history
    @battle.execute_turn(@moves) if @battle.valid_turn(@moves)
    redirect_to battle_path
  end



end
