import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected: function() {
    console.log("Connected to Chat");
  },

  disconnected: function() {
    console.log("Disconnected from Chat");
  },

  received: function(data) {
    var messages = $('#chatbox');
    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
  }
});
