App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    // console.log("test");
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    const chatMessages = document.getElementById("chat-messages");
    chatMessages.insertAdjacentHTML("beforeend", data["chat_message"]);
  },

  speak: function(chat_message, chat_room_id) {
    return this.perform("speak", {
      chat_message: chat_message,
      chat_room_id: chat_room_id,
    });
  },
});

document.addEventListener("DOMContentLoaded", function() {
  const input = document.querySelector(".chat-room__message-form_textarea");
  const btn = document.querySelector(".fa-paper-plane");
  btn.addEventListener("click", function() {
    const content = input.value;
    const chat_room_id = input.dataset.chatRoomId;
    App.room.speak(content, chat_room_id);
    input.value = "";
  });

  document.addEventListener("keydown", function(e) {
    if (e.key === "Enter") {
      const content = input.value;
      const chat_room_id = input.dataset.chatRoomId;
      App.room.speak(content, chat_room_id);
      input.value = "";
      e.preventDefault(); //submitイベントの発生元であるフォームが持つデフォルトの動作をキャンセル
    }
  });
});
