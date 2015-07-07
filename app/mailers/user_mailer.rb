class UserMailer < ApplicationMailer
  default from: "notifications@epicodus.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/log-in"
    mail(to: @user.email, subject: "Welcome to our site!")
  end

  def new_question_email(user, question)
    @user = user
    @question = question
    @url = "http://localhost:3000/questions/#{@question.id}"
    mail(to: @user.email, subject: "Thanks for asking a question!")
  end

  def answered_email(user, question)
    @user = user
    @question = question
    @url = "http://localhost:3000/questions/#{@question.id}"
    mail(to: @user.email, subject: "Your question has been answered!")
  end
end
