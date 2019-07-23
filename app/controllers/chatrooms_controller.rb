class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    # raise
  end
end
