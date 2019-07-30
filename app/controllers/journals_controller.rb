class JournalsController < ApplicationController
  before_action :set_questions
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
