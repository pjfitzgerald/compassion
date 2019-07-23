class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :update]
  before_action :authenticate_user!, only: [:update]

  def show
    @questions = ["What is your favorite sport?", "What is your favorite season?",
                  "What is your favorite dish?", "What is your favorite animal?",
                  "What is your favorite activity?"]
  end

  # def update
  #   @user.update(age_range: params[:user][:age_range], gender: params[:user][:gender])
  #   if @user.save!
  #     @user.update!(answered: true)
  #     redirect_to user_path(@user)
  #   else
  #     render :survey
  #   end
  # end

  def survey
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:age_range, :user, :gender)
  end
end
