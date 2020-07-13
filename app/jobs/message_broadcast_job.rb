class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat", {
      message: render_message(message)
    }
  end

  private
  def render_message(message)
    u = User.find_by(id: message.user_id)
    username = u.username
    MessagesController.render(
      partial: 'message',
      locals: {
        message: message,
        username: username
      }
    )
  end
end
