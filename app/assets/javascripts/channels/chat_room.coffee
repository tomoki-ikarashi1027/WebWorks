# App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",
#   connected: ->
#     # Called when the subscription is ready for use on the server
#     console.log("connect!");

#   disconnected: ->
#     # Called when the subscription has been terminated by the server

#   received: (data) ->
#     # Called when there's incoming data on the websocket for this channel

#   speak: ->
#     @perform 'speak'
