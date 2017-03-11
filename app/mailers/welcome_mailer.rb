class WelcomeMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Code Connection')
  end
end

#I used placeholder here because I couldn't find and url for Code Connection
