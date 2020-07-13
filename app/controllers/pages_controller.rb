class PagesController < ApplicationController
  def main
    @messages = Message.all
    @message = Message.new
  end
end
