class UserMailer < ApplicationMailer
  default from: "notifications@epicodus.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/log-in"
    mail(to: @user.email, subject: "Welcome to our site!")
  end
end
