class MatchesController < ApplicationController
  before_action :set_user

  def new
    @match = Match.new
  end

  def create
    @match = Match.new
    @chatroom = Chatroom.new(match_id: @match.id)
    current_user.searching = true
    if @other_user = User.find_by(category: current_user.category, searching: true)
      if @other_user != current_user    
        @other_user = User.find_by(category: current_user.category, searching: true)
      end
    end

    if current_user.id > @other_user.id
      @match.user_id = current_user.id
      @match.partner_id = @other_user.id
      redirect_to chatroom_path(@chatroom.id)
    else
      @match.user_id = @other_user.id
      @match.partner_id = current_user.id
      redirect_to chatroom_path(@chatroom.id)
    end
  end

  def categorise
    @category
  end

  def index
    @matches = Match.all
  end

  private

  def set_user
    @user = current_user
  end

end
