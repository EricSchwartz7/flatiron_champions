class UsersController < ApplicationController

  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  # def create
  #   @user = User.new(params[:user])
  #
  #   respond_to do |format|
  #     if @user.save
  #       # Tell the UserMailer to send a welcome email after save
  #       UserMailer.welcome_email(@user).deliver_later
  #
  #       format.html { redirect_to(@user, notice: 'User was successfully created.') }
  #       format.json { render json: @user, status: :created, location: @user }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      create_student_with_abilities

      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(@user).deliver_now

      # format.html { redirect_to(@user, notice: 'User was successfully created.') }
      # format.json { render json: @user, status: :created, location: @user }

      redirect_to @user
    else
      flash[:notice] = "Could not create account due to the following errors:"
      render :new
    end
  end

  def show
    # require_login
    @user = current_user
    @characters = @user.characters
    @current_character_id = @characters.first.id
    @active_battle = @characters.first.active_battle
    @active_challenge = @characters.first.active_challenge
    @active_invitations = @characters.first.active_invitations
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
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :nickname)
  end
end
