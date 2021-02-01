App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log("con77kkk7t");
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    const messages = document.getElementById("messages");
    messages.innerHTML += `<p>${data}</p>`;
  },

  speak: function(content) {
    return this.perform("speak", { message: content });
  },
});

document.addEventListener("DOMContentLoaded", function() {
  const input = document.getElementById("chat-input");
  const btn = document.getElementById("button");
  btn.addEventListener("click", function() {
    const content = input.value;
    App.room.speak(content);
    input.value = "";
  });
});
