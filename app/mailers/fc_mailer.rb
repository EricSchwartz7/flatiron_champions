class FcMailer < ApplicationMailer

  def welcome_email(user)
     @user = user
     mail(to: @user.email, subject: 'Welcome to Flatiron Champions!')
  end

end
