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
});

document.addEventListener("DOMContentLoaded", function() {
  const documentElement = document.documentElement;
  const messageButton = document.querySelector(".chat_btn");
  const input = document.querySelector(".chat-room__message-form_textarea");

  const button_activation = function() {
    if (input.value === "") {
      messageButton.classList.add("none-btn");
    } else {
      messageButton.classList.remove("none-btn");
    }
  };
  input.addEventListener("input", function() {
    button_activation();
  });

  const scrollToBottom = function() {
    scroll(0, documentElement.scrollHeight);
  };
  scrollToBottom();
});

// const messageContent = document.querySelector(
//   ".chat-room__message-form_textarea"
// );

// フォームに入力した際の動作s

// 送信ボタンが押された時にボタンを無効化

// messageContent.addEventListener("input", () => {
//   chat_button.classList.add("test");
// });

// chat_button.addEventListener("click", function() {
//   console.log("eee");
// });

// document.addEventListener("DOMContentLoaded", function() {
//   const input = document.querySelector(".chat-room__message-form_textarea");
//   const btn = document.querySelector(".fa-paper-plane");
//   btn.addEventListener("click", function() {
//     const content = input.value;
//     const chat_room_id = input.dataset.chatRoomId;
//     App.room.speak(content, chat_room_id);
//     input.value = "";
//   });

//   document.addEventListener("keydown", function(e) {
//     if (e.key === "Enter") {
//       const content = input.value;
//       const chat_room_id = input.dataset.chatRoomId;
//       App.room.speak(content, chat_room_id);
//       input.value = "";
//       e.preventDefault(); //submitイベントの発生元であるフォームが持つデフォルトの動作をキャンセル
//     }
//   });
// });
