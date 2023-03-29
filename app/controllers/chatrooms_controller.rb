class ChatroomsController < ApplicationController
  def index
    @my_chatrooms = Chatroom.all.select { |chatroom| (chatroom.user1 || chatroom.user2) == current_user }
    @current_user = current_user
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @current_user = current_user
  end
end
