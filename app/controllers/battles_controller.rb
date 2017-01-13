class BattlesController < ApplicationController
  before_action :require_login

  def new
    users = User.where("id != ?", current_user.id)
    @inactive_users = users.select { |user| user.characters.first.active_battle.nil? }
    @active_users = users.select { |user| !user.characters.first.active_battle.nil? }
    @active_battles = Battle.where(winner_id: nil) & Battle.where.not(accepted: false)
    @battle = Battle.new
  end

  def create
    @opponent_character = User.find(params[:battle][:opponent_id]).characters.first
    @battle = Battle.new(challenger_id: current_user.characters.first.id, opponent_id: @opponent_character.id, challenger_hp: current_user.characters.first.hp, opponent_hp: @opponent_character.hp)
    unless @opponent_character.active_battle.nil?
      flash[:notice] = "That user has an ongoing battle. Please choose another opponent."
      redirect_to new_battle_path
    else
      @battle.save
      redirect_to @battle
    end
  end

  def challenge_response
    @user = current_user
    if params[:invite] == 'decline'
      @battle = current_user.characters.first.active_invitation
      @battle.accepted = false
      @battle.save
      redirect_to @user
    elsif params[:invite] == 'accept'
      @battle = current_user.characters.first.active_invitation
      @battle.accepted = true
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
    if @battle.challenger.xp >= 50 && @battle.challenger.char_type == 'student' && current_user.id == @battle.challenger.user.id
      redirect_to start_evolution_path
    end
    if @battle.opponent.xp >= 50 && @battle.opponent.char_type == 'student' && current_user.id == @battle.opponent.user.id
      redirect_to start_evolution_path
    end
  end

  def move
    if params[:character_ability_id].blank?
      flash[:notice] = 'Please select a move.'
      redirect_to battle_path and return
    end

    @battle = Battle.find(params[:id])
    @ability_used = CharacterAbility.find(params[:character_ability_id])
    if @battle.valid_move(@ability_used)
      @move = Move.create(battle_id: @battle.id, character_ability_id: params[:character_ability_id])
    else
      if @battle.battle_over?
        flash[:notice] = 'You cannot submit a move when the battle is over.'
      else
        flash[:notice] = 'Valid Move Was NOT Submitted or you already made your move.'
      end
      redirect_to battle_path and return
    end
    @battle = Battle.find(params[:id])
    @updated_moves = @battle.battle_move_history
    @battle.execute_turn if @battle.valid_turn(@updated_moves)

    redirect_to battle_path
  end

  def train

    # select a random pokemon

      #gives it a random level

    # creates the battle

  end

  def train_move

    #user submits move

    #random moves selected for AI

    # turn executes
  end



  def destroy
    @user = current_user
    @battle = @user.characters.first.active_challenge
    @battle.destroy
    redirect_to @user

  end

end
