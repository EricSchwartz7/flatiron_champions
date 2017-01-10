class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Could not create account due to the following errors:"
      render :new
    end
  end

  def show
    require_login
    @user = current_user
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :nickname)
  end
end
