class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    # binding.pry
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # binding.pry
    Message.create(content: data['message'])
    ActionCable.server.broadcast 'room_channel', data['message']
  end
end
