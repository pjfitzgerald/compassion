class JournalsController < ApplicationController
  before_action :set_questions, :set_journal

  # def show
  #   redirect_to journal_posts_path
  # end

  private

  def set_journal
    if current_user.journal
      true
    else
      @journal = Journal.new(user: current_user)
    end
  end
end
