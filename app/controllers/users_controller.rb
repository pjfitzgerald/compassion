require 'csv'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :new_match]
  before_action :set_chatrooms, only: [:show, :ongoing_chats]

  before_action :authenticate_user!, only: [:update]

  def show
    @user_count = User.all.count
    filepath = File.join(Rails.root, 'config', 'questions.csv')
    questions_list = []
    CSV.foreach(filepath) do |row|
      unless row[1].nil?
        unless row[1].split("").count > 50
          questions_list << row[1] unless row[1].empty?
        end
      end
    end
    @questions = questions_list[3, 5]
  end

  def searching
    @user.update(searching: true)
  end

  def ongoing_chats
  end

  def new_match
    @category = @user.category
    @users = User.where(category: @category).where(searching: true) - [@user] - @user.matches.map { |match| match.partner }
    @other_user = @users.sample
    @match = Match.new(user: @user, partner: @other_user)
    if @match.save
      @chatroom = Chatroom.create(match: @match)
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to user_path(@user), alert: "unable to find match at this time"
    end
  end

  def update
    @collection = ["n/a", "1", "2", "3", "4", "5"]
    @user = current_user
    # If previous page was the survey
    if params[:user][:survey] == "true"
      update_answers
      # If User answered only some of the questions in the survey
      if @user.answer_one.zero? || @user.answer_two.zero? ||
         @user.answer_three.zero? || @user.answer_four.zero? ||
         @user.answer_five.zero?
        @user.update(answered: false)
      # If user answered all five survey questions
      else
        @user.update(answered: true)
      end
      # If user has a profile already (coming from the survey)
      if @user.profiles.count.zero?
        redirect_to profile_choose_path
      else
        redirect_to user_path(@user)
      end
    # If the user toggles the searching button
    elsif params[:user][:searching].present?
      @user.update(searching: params[:user][:searching])
      redirect_to user_path(@user)
    # If User attempts an email update
    elsif params[:user][:email].present? && params[:user][:password].nil?
      # If the email already exists in the database
      if User.where(email: params[:user][:email]).exists?
        flash[:notice] = "User already exists!"
      else
        flash[:notice] = "Email updated!"
        @user.update(email: params[:user][:email])
      end
      redirect_to user_path(@user)
    # If user is answering daily questions
    elsif params[:user][:d_answer_one].present?
      @user.update(d_answer_one: params[:user][:d_answer_one])
      redirect_to user_path(@user)
    elsif params[:user][:d_answer_two].present?
      @user.update(d_answer_two: params[:user][:d_answer_two])
      redirect_to user_path(@user)
    elsif params[:user][:d_answer_three].present?
      @user.update(d_answer_three: params[:user][:d_answer_three])
      redirect_to user_path(@user)
    # If previous page was the profile choose page
    elsif params[:user][:profileanimal].present?
      # If user already has an profile
      if @user.profiles.count >= 1
        @user.profiles.last.destroy
        update_profile
      else
        update_profile
      end
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

  def update_answers
    @user.update(answer_one: params[:user][:answer_one],
                 answer_two: params[:user][:answer_two],
                 answer_three: params[:user][:answer_three],
                 answer_four: params[:user][:answer_four],
                 answer_five: params[:user][:answer_five])
  end

  def update_profile
    Profile.create(animal: params[:user][:profileanimal],
                   adjective: params[:user][:profileadj],
                   description: params[:user][:profiledesc],
                   image: params[:user][:profileimg],
                   user_id: current_user.id)
  end

  def set_chatrooms
    @user = current_user
    @chatrooms = Chatroom.where(user_id: @user.id).or(Chatroom.where(partner_id: @user_id))
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:age_range, :user, :gender,
                                 :answer_one, :answered, :answer_two,
                                 :answer_three, :answer_four, :answer_five,
                                 :d_answer_one, :d_answer_two, :d_answer_three)
  end
end
