class SessionsController < Devise::SessionsController
  protected

  def after_sign_up_path_for(resource)
    survey_path
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
