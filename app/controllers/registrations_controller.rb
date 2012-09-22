class RegistrationsController < Devise::RegistrationsController

	def edit
		@answers = current_applicant.answers
	end

	def update
    answers = params[:answers]
    answers.each do |question_id, answer| 
      temp = Answer.where("question_id = ? AND applicant_id = ?", question_id, current_applicant.id).first
      temp.update_attributes(:content => answer)
    end
    redirect_to edit_applicant_registration_path(current_applicant)
	end

	protected

	def after_sign_up_path_for(resource)
	  submit_signup_form_path ## recruit#create
  end
  
  def after_sign_in_path_for(resource)
    edit_application_form_path ## Recruit#edit
  end


end
