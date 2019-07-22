class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @question = ["Do you like sports?", "Do you enjoy cooking?", "Do you sing in the shower?"].sample
  end
end
