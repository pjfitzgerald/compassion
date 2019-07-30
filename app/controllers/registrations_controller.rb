class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    @journal = Journal.new(user_id: User.last.id + 1)
    survey_path
  end
end
