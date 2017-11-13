class UserMailer < ApplicationMailer
  default from: "clr2107@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "example"
    mail(to: @user.email, subject: 'test email')
  end
end
