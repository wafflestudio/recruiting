class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    edit_applicant_registration_path ## registrations#edit
  end
end
