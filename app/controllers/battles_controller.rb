class BattlesController < ApplicationController

  def show
    @battle = Battle.find(params[:id])
    @challenger_character = Character.find(@battle.challenger_id)
    @opponent_character = Character.find(@battle.opponent_id)
    @challenger = User.find(@challenger_character.user_id)
    @opponent = User.find(@opponent_character.user_id)
  end

  def move
    if it_is_the_users_turn?
      if challengers_move?
        @move = Move.new(params[:challenger][:ability])
      elsif(!!params[:opponent])
        @move = Move.new(params[:opponent][:ability])
      else
        flash[:notice] = 'Valid Move Was NOT Submitted'
        render :new and return
      end
      @move.save
    else
      flash[:notice] = 'It is not your move.'
    end

    if valid_turn
      execute_turn(moves)
      redirect_to battle_path
    end



end
