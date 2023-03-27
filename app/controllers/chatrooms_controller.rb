class ChatroomsController < ApplicationController
  def show
    @chatroom = set_chatroom
  end

  private

  def set_chatroom
    Chatroom.find(params[:id])
  end
end
