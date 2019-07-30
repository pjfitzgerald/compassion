class ProfilesController < ApplicationController
  before_action :set_profile, only: [:new, :create]
  before_action :set_user, only: [:new, :create]
  before_action :profile_params, only: :create

  def new
    @profile = Profile.new
    filepath_adjective = File.join(Rails.root, 'config', 'adjectives.csv')
    filepath_animal = File.join(Rails.root, 'config', 'animals.csv')
    @adjectives = []
    @animals = []
    CSV.foreach(filepath_adjective) do |row|
      @adjectives << row[1] + "|" + row[2]
    end
    CSV.foreach(filepath_animal) do |row|
      @animals << row[1]
    end
    @joined = @adjectives.sample.split("|")
    @profile.adjective = @joined.first
    @profile.description = @joined.last
    @profile.animal = @animals.sample
  end

  def create
    @profile = Profile.new(profile_params)
  end

  private

  def set_profile
    @profile = Profile.new
  end

  def set_user
    @user = current_user
  end

  def profile_params
    params.require(:profile).permit(:animal, :adjective, :description)
  end
end
