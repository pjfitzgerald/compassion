class MatchesController < ApplicationController
  def new
    @match = Match.new
    @other_user = User.find_by(category: current_user.category, searching: true)
    if current_user.id > @other_user.id
      @match.user_id = current_user.id
      @match.partner_id = @other_user.id
    else
      @match.user_id = @other_user.id
      @match.partner_id = current_user.id
    end
  end

  def create
    @match = Match.new
    User.all.each
  end

  def categorise
    @category
  end

end
