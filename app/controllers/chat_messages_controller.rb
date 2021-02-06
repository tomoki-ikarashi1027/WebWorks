class ChatMessagesController < ApplicationController
  def create
    # if ChatRoomUser.where(user_id: current_user.id, chat_room_id: params[:chat_message][:chat_room_id]).present?
      @room = ChatRoom.find(params[:chat_message][:chat_room_id])
      @message = ChatMessage.new(message_params)
      @message.chat_room_id = @room.id
      @message.user_id = current_user.id
      @message.save
  end

  private
  def message_params
      params.require(:chat_message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end
end
