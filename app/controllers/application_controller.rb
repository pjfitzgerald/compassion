class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :age_range, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def set_questions
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
end
