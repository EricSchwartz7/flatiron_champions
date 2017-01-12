class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      create_student_with_abilities
      redirect_to @user
    else
      flash[:notice] = "Could not create account due to the following errors:"
      render :new
    end
  end

  def show
    require_login
    @user = current_user
    @characters = @user.characters
    @current_character_id = @characters.first.id
    @active_battle = @characters.first.active_battles.last
    # binding.pry
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to @user
  end

  def delete
  end

  private

  def create_student_with_abilities
    @character = Character.create(char_type: 'student', user_id: current_user.id)
    @character.abilities << Ability.where(char_type: 'student')
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :nickname)
  end
end
