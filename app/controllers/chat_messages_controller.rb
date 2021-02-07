class ChatMessagesController < ApplicationController
  def create
      @room = ChatRoom.find(params[:chat_message][:chat_room_id])
      @chat_room_user = @room.chat_room_users.where.not(user_id: current_user.id).first.user
      @message = ChatMessage.new(message_params)
      @message.chat_room_id = @room.id
      @message.user_id = current_user.id
      if @message.save
        notification = current_user.active_notifications.new(
          chat_room_id: @room.id,
          chat_message_id: @message.id,
          visited_id: @chat_room_user.id,
          visitor_id: current_user.id,
          action: 'chat'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
      end
  end

  private
  def message_params
      params.require(:chat_message).permit(:content)
  end
end
