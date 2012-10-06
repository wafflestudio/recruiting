class RegistrationsController < Devise::RegistrationsController
  def edit
    @answers = current_applicant.answers
    @questions = Question.where(:order => current_order).order("priority asc")
  end

  def update
    answers = params[:answers]
    answers.each do |question_id, answer| 
      temp = Answer.where("question_id = ? AND applicant_id = ?", question_id, current_applicant.id).first
      if temp.nil?
        temp = Answer.new(:applicant_id => current_applicant.id, :question_id => question_id)
        temp.content = answer
        temp.save
      else
        temp.update_attributes(:content => answer)
      end
    end
    redirect_to edit_applicant_registration_path, :notice => "Your changes were saved"
  end

  protected

  # The following two methods were overwritten to modify the redirection URLs after the 
  # applicant signs up through the Devise-made login/signup page but since we have overwritten the 
  # URLs in our routes structure, we don't need them

  def after_sign_up_path_for(resource)
    submit_signup_form_path ## recruit#create
  end

end
