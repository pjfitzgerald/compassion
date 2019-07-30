class JournalsController < ApplicationController
  before_action :set_questions, :set_journal
  belongs_to :user
end
