require 'csv'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :update]
  before_action :authenticate_user!, only: [:update]

  def show
    filepath = File.join(Rails.root, 'config', 'questions.csv')
    @questions = []
    CSV.foreach(filepath) do |row|
      unless row.empty?
        unless row[1].nil?
          @questions << row[1] unless row[1].empty?
        end
      end
    end
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
