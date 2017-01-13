class UserMailer < ApplicationMailer

  def invitation_email(challenger, opponent)
     @challenger = challenger
     @opponent = opponent
     mail(to: @opponent.email, subject: "New Flatiron Champions Challenge!")
  end

end
