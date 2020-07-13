class MessageWithUsername
  def initialize(created_at, username, body)
    @created_at = created_at
    @username = username
    @body = body
  end

  def created_at
    return @created_at
  end

  def username
    return @username
  end

  def body
    return @body
  end
end

class PagesController < ApplicationController
  def main
    @messagesWithUsername = Array.new
    @messages = Message.all
    @messages.each do |message|
      u = User.find_by(id: message.user_id)
      m = MessageWithUsername.new(message.created_at, u.username, message.body)
      @messagesWithUsername.push(m)
    end
    @m = Message.new
  end
end
