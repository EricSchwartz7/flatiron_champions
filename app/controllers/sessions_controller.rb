class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Username or password did not match our records."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
  
end
