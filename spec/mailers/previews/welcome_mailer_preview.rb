# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
  def welcome_email
    WelcomeMailer.welcome_email(User.first)
  end
end
