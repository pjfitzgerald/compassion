class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
    @user = current_user
    @messages = @chatroom.messages.order(created_at: :asc).last(20)
    @message = Message.new
    # raise
  end
end
