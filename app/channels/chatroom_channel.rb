class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    chatroom = Chatroom.find(params[:id])
    stram_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
