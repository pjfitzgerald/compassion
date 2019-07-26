require 'csv'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :username_pick, :new_match]
  before_action :authenticate_user!, only: [:update]

  def show
    filepath = File.join(Rails.root, 'config', 'questions.csv')
    @questions = []
    # @chatroom = Chatroom.find(user_id: current_user.id)
    @match = Match.new
    CSV.foreach(filepath) do |row|
      unless row[1].nil?
        unless row[1].split("").count > 50
          @questions << row[1] unless row[1].empty?
        end
      end
    end
  end

  def searching
    @user.update(searching: true)
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
    # if previous page was survey
    #   save answer params to current_user
    # => and redirect to customize_user_path
    # elsif previous page was profile input page
    # => create a new profile and set current user as profile.user_id
    # => redirect to user_path (dashboard)
    # else
    #   render survey

    # if (@user.answer_one.present? || @user.answer_two.present? ||
    #    @user.answer_three.present? || @user.answer_four.present? ||
    #    @user.answer_five.present?)

    # elsif

    if params[:user][:survey] == "true"
      @user.update(answer_one: params[:user][:answer_one],
                   answer_two: params[:user][:answer_two],
                   answer_three: params[:user][:answer_three],
                   answer_four: params[:user][:answer_four],
                   answer_five: params[:user][:answer_five])
      if @user.profiles.count.zero?
        redirect_to profile_choose_path
      else
        redirect_to user_path(@user)
      end
    elsif params[:user][:profileanimal].present?
      if @user.profiles.count >= 1
        @user.profiles.last.destroy
        Profile.create(animal: params[:user][:profileanimal],
                       adjective: params[:user][:profileadj],
                       description: params[:user][:profiledesc],
                       image: params[:user][:profileimg],
                       user_id: current_user.id)
      else
        Profile.create(animal: params[:user][:profileanimal],
                       adjective: params[:user][:profileadj],
                       description: params[:user][:profiledesc],
                       image: params[:user][:profileimg],
                       user_id: current_user.id)
      end
      redirect_to user_path(@user)
    else
      render :survey
    end
  end

    # if params[:user][:profileanimal].present?
    #   Profile.create(animal: params[:user][:profileanimal], adjective: params[:user][:profileadj],
    #                description: params[:user][:profiledesc],
    #                image: params[:user][:profileimg], user_id: current_user.id)
    # else
    #   unless @user.answer_one.present? || @user.answer_two.present? ||
    #          @user.answer_three.present? || @user.answer_four.present? ||
    #          @user.answer_five.present?
    #     @user.update(answer_one: params[:user][:answer_one], answer_two: params[:user][:answer_two],
    #                  answer_three: params[:user][:answer_three], answer_four: params[:user][:answer_four],
    #                  answer_five: params[:user][:answer_five])
    #     if @user.answer_one.zero? || @user.answer_two.zero? ||
    #        @user.answer_three.zero? || @user.answer_four.zero? ||
    #        @user.answer_five.zero?
    #       @user.update(answered: false)
    #     else
    #       @user.update(answered: true)
    #     end
    #   end
    # end
    # if @user.save
    # raise
    #   redirect_to user_path(@user)
    # else
      # render :survey
    # end
  # end

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
                                 :answer_one, :answered, :answer_two,
                                 :answer_three, :answer_four, :answer_five,
                                 :d_answer_one, :d_answer_two, :d_answer_three)
  end
end
