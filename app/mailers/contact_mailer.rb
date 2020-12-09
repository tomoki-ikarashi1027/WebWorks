class ContactMailer < ApplicationMailer
  default from: 'from@example.com'

  def user_welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Web Works!')
  end

  def send_when_admin_reply(user, contact)
    @user = user
    @answer = contact.reply #返信内容
    mail(to: @user.email, subject: '【Web Works】 お問い合わせありがとうございます')
  end
end
