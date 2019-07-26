class ChatroomsController < ApplicationController
  def show
    @chatrooms = Chatroom.includes(messages: :user).find(params[:id])
    @chatroom = Chatroom.find(params[:id])
    @user = current_user
    @messages = @chatroom.messages.order(created_at: :asc).last(20)
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create

  end
end
