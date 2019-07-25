require 'csv'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new]
  before_action :authenticate_user!, only: [:update]

  def show
    filepath = File.join(Rails.root, 'config', 'questions.csv')
    @questions = []
    CSV.foreach(filepath) do |row|
      unless row[1].nil?
        unless row[1].split("").count > 50
          @questions << row[1] unless row[1].empty?
        end
      end
    end
  end

  def update
    @collection = ["n/a", "1", "2", "3", "4", "5"]
    @user = current_user
    @user.update(answer_one: params[:user][:answer_one], answer_two: params[:user][:answer_two],
                 answer_three: params[:user][:answer_three], answer_four: params[:user][:answer_four],
                 answer_five: params[:user][:answer_five])
    if @user.answer_one == 0 || @user.answer_two == 0 ||
       @user.answer_three == 0 || @user.answer_four == 0 ||
       @user.answer_five == 0
      @user.update(answered: false)
    else
      @user.update(answered: true)
    end
    if @user.save
      redirect_to user_path(@user)
    else
      render :survey
    end
  end

  def survey
    @user = current_user
  end

  def new
    @user = User.new
    @user.answered = false
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:age_range, :user, :gender,
                                 :answer_one, :answered, :answer_two, :answer_three,
                                 :answer_four, :answer_five, :d_answer_one,
                                 :d_answer_two, :d_answer_three)
  end
end
