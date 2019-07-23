class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    user_survey_path(current_user)
  end
end
