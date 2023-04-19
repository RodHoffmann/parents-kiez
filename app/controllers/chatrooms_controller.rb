class ChatroomsController < ApplicationController
  def index
    @my_chatrooms = Chatroom.all.select { |chatroom| (chatroom.user1 == current_user) || (chatroom.user2 == current_user) }
    @current_user = current_user
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @current_user = current_user
  end

  def new
    user1 = current_user
    @babysitter = Babysitter.find(params[:format])
    user2 = @babysitter.user
    if !Chatroom.where(user1: current_user, user2: user2).empty?
      @chatroom = Chatroom.where(user1: current_user, user2: user2)[0]
    elsif !Chatroom.where(user1: user2, user2: current_user).empty?
      @chatroom = Chatroom.where(user1: user2, user2: current_user)[0]
    else
      @chatroom = Chatroom.new(user1: current_user, user2: user2)
      @chatroom.save!
    end
    redirect_to chatroom_path(@chatroom)
  end
end
