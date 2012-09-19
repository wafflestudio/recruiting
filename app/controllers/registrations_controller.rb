class RegistrationsController < Devise::RegistrationsController

	def edit
		@answers = current_applicant.answers
	end

	def update
    
	end

	protected

	def after_sign_up_path_for(resource)
	  submit_application_form_path
  end
  
  def after_sign_in_path_for(resource)
    edit_application_form_path
  end


end
