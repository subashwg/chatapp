class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.save
  end

  private 
  def message_params
    params.require(:message).permit(:body)
  end
end
