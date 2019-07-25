class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.new
    User.all.each
  end
end
