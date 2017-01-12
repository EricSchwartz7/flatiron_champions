class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

 private

 def current_user
   if logged_in?
     @user ||= User.find(session[:user_id])
   end
 end

 def logged_in?
   !!session[:user_id]
 end

 def require_login
   unless logged_in?
     flash[:notice] = "You must be logged in to view this page."
     redirect_to login_path
   end
 end

end
