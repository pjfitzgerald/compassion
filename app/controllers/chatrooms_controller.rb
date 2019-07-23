class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
  end
end
