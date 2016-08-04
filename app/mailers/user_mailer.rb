class UserMailer < ActionMailer::Base
  default from: "Cats <ian@example.com>"

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new?'
    mail(to: "ian.hall5590@gmail.com", subject: 'Welcome to my cat site')
  end

  def reminder_email(user)

  end

end
