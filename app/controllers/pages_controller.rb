require 'csv'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @question = "Autumn"
  end

  def landing
    @email = WaitlistEmail.new
    # if @waitlist_email.save
    #   raise
    #   redirect_to waitlist_path
    # else
    #   # raise
    #   # render :alert 
    # end
  end

  def waitlist
    @email = WaitlistEmail.new
  end

  def save_email
    @email = WaitlistEmail.new(email_params)
    
    if @email.save
      redirect_to waitlist_path
    else
      render :landing
    end
  end


  private

  def email_params
    params.require(:waitlist).permit(:address)
  end
end
