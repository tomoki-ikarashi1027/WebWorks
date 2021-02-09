class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_comments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :communities, dependent: :destroy
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  has_many :chat_messages
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :self_introduction, length: { maximum: 300 }

  after_create :send_welcome_mail

  mount_uploader :profile_image, ImageUploader

  def send_welcome_mail
    ContactMailer.user_welcome_mail(self).deliver_now
  end

  def update_without_current_password(params, *options)

    if params[:current_password].blank? && params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:current_password)
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def liked_by?(community_id)
    self.likes.where(community_id: community_id ).exists?
  end
end
