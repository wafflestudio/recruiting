class RegistrationsController < Devise::RegistrationsController

	def edit
		@answers = current_applicant.answers
	end

	def update

	end

	protected

	def after_sign_up_path_for(resource)
		new_applicant_path
	end
end
