class MessagesController < ApplicationController
  # before_action :set_message, only: [:create]

  def create
    if params[:content]
      @message = Message.new(content: params[:message])
    else
      @message = Message.new(message_params)
    end
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.user = current_user
    @message.chatroom = @chatroom
    if @message.save
      respond_to do |format|
        format.html { redirect_to chat_room_path(@chat_room) }
        format.js
      end
    else
      redirect_to chatroom_path(params[:id])
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
    authenticate @message
  end

  def set_chatroom
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
  end
end
