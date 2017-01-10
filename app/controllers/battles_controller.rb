class BattlesController < ApplicationController

  def show
    @battle = Battle.find(params[:id])
    @challenger_character = Character.find(@battle.challenger_id)
    @opponent_character = Character.find(@battle.opponent_id)
    @challenger = User.find(@challenger_character.user_id)
    @opponent = User.find(@opponent_character.user_id)
  end

  def move
    @battle = Battle.find(params[:id])
    challengers_move = !!params[:challenger]
    if @battle.it_is_the_users_turn?(challengers_move)
      if challengers_move
        @move = Move.new(params[:challenger])
      elsif(!!params[:opponent])
        @move = Move.new(ability_id: params[:opponent][:ability_id])
      else
        flash[:notice] = 'Valid Move Was NOT Submitted'
        render :new and return
      end
      @move.save
    else
      flash[:notice] = 'It is not your move.'
    end
    if @battle.valid_turn
      @battle.execute_turn(moves)
      redirect_to battle_path
    end
  end
end
