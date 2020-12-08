class ContactMailer < ApplicationMailer

  def user_welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Web Works!')
  end
end
