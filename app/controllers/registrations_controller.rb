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
    redirect_to home_page_path, :notice => "Your changes were saved"
  end

  protected

  # The following two methods were overwritten to modify the redirection URLs after the 
  # applicant signs up through the Devise-made login/signup page but since we have overwritten the 
  # URLs in our routes structure, we don't need them

  def after_sign_up_path_for(resource)
    submit_signup_form_path ## recruit#create
  end

  def after_sign_in_path_for(resource)
    edit_applicant_registration_path ## registrations#edit
  end
end
