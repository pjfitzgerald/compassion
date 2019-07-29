class ChatroomsController < ApplicationController
  before_action :set_chatrooms, only: :destroy

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
    current_user.searching = true
    unless User.find_by(category: current_user.category).count > 1
      # JS searching animation on dashboard
      redirect_to user_path(current_user.id)
    else
      @other_users = User.where(category: current_user.category, searching: true)
      @other_user = @other_users.first_except(current_user)
      @chatroom = Chatroom.new(match_id: @match.id)
      if current_user.id > @other_user.id
        @match.user_id = current_user.id
        @match.partner_id = @other_user.id
        current_user.searching = false
        @other_user.searching = false
      else
        @match.user_id = @other_user.id
        @match.partner_id = current_user.id
        current_user.searching = false
        @other_user.searching = false
      end
      redirect_to chatroom_path(@chatroom.id)
    end
  end

  def destroy
    @chatrooms.match.destroy
    redirect_to current_user
  end

  private

  def set_chatrooms
    @chatrooms = Chatroom.find(params[:id].to_i)
  end

  def chatrooms_params
    params.require(:chatrooms).permit(:id)
  end
end
