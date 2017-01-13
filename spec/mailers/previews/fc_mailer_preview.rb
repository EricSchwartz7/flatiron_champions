# Preview all emails at http://localhost:3000/rails/mailers/fc_mailer
class FcMailerPreview < ActionMailer::Preview
  def welcome_mail_preview
    ApplicationMailer.welcome_email(User.first)
  end
end
