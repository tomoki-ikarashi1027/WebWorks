App.chat = App.cable.subscriptions.create("ChatRoomChannel", {
  connected: function() {
    //called when the subscription is ready for use on the server
    console.log(777);
  },

  disconnected: function() {
    //called when the subscription has been terminated by the server
  },

  received: function(data) {},
});
