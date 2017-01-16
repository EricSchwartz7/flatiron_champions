class UserMailer < ApplicationMailer

  def welcome_email(user)
     @user = user
     mail(to: @user.email, subject: 'Welcome to Flatiron Champions!')
  end

  def invitation_email(challenger, opponent)
     @challenger = challenger
     @opponent = opponent
     mail(to: @opponent.email, subject: "New Flatiron Champions Challenge!")
  end

end
