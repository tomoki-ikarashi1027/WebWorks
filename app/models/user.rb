class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_comments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :tasks, dependent: :destroy

  after_create :send_welcome_mail

  def send_welcome_mail
    ContactMailer.user_welcome_mail(self).deliver_now
  end
end
