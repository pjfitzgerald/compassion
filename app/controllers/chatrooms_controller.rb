class ChatroomsController < ApplicationController
  before_action :set_chatrooms, only: :destroy
  before_action :set_questions, only: :show
  before_action :set_rooms, only: :show

  def show
    @chatrooms = Chatroom.includes(messages: :user).find(params[:id])
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.order(created_at: :asc).last(20)
    @message = Message.new
    @user = current_user
    if current_user == @chatroom.match.user
      @other_user = @chatroom.match.partner
    else
      @other_user = @chatroom.match.user
    end
    @other_rooms = Chatroom.where(match: @matches).where.not(id: @chatroom.id)
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

  def set_questions
    @user_count = User.all.count
    filepath = File.join(Rails.root, 'config', 'questions.csv')
    questions_list = []
    CSV.foreach(filepath) do |row|
      unless row[1].nil?
        unless row[1].split("").count > 50
          questions_list << row[1] unless row[1].empty?
        end
      end
    end
    @questions = questions_list[3, 5]
  end

  def set_chatrooms
    @chatrooms = Chatroom.find(params[:id].to_i)
  end

  def set_rooms
    @matches = Match.where(user_id: current_user.id).or(Match.where(partner_id: current_user.id))
    @rooms = @matches.map {|match| match.chatroom}
  end

  def chatrooms_params
    params.require(:chatrooms).permit(:id)
  end
end
