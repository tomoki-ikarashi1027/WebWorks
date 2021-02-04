class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

  after_create_commit {ChatMessageBroadcastJob.perform_later self}

  # def create_notification_like!
  #   notification = current_user.active_notifications.new(
  #     visited_id: @chat_room_user.id,
  #     visitor_id: current_user.id,
  #     action: 'chat',
  #     chat_room_id: data['chat_room_id'],
  #     chat_message_id: @chat_message.id
  #   )
  #   if notification.visitor_id == notification.visited_id
  #     notification.checked = true
  #   end
  #   notification.save if notification.valid?
  # end
end
