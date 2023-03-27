class ChatroomsController < ApplicationController
  def show
    @chatroom = set_chatroom
    @message = Message.new
  end

  private

  def set_chatroom
    Chatroom.find(params[:id])
  end
end
