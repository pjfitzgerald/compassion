class MatchesController < ApplicationController
  def new
    @match = Match.new
    @other_user = User.find_by(category: current_user.category)
    if current_user.id > @other_user.id
      @match.user_id = current_user.id
      @match.partner_id = @other_user.id
    else
      @match.user_id = @other_user.id
      @match.partner_id = current_user.id
    end
  end

  def create
    @match = Match.new(match_params)
  end

  def categorise
    @category
  end

  def index
    @matches = Match.all
  end

  private

  def match_params
    params.require(:match).permit(:user_id, :partner_id)
  end
end
