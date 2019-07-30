class JournalsController < ApplicationController
  def new
    @journal = Journal.new
  end

  def create
    # if @journal
  end

  def show
    @journal = Journal.find_by(user_id: current_user.id)
  end
end
