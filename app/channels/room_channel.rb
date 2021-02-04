class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat_message = ChatMessage.create!(
      content: data['chat_message'],
      user_id: current_user.id,
      chat_room_id: data['chat_room_id'],
    )
    chat_room = ChatRoom.find(params[:id])
    chat_room_user = chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
    notification = current_user.active_notifications.new(
      visited_id: chat_room_user.id,
      visitor_id: current_user.id,
      action: 'chat',
      chat_room_id: chat_room.id,
      chat_message_id: chat_message.id
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
