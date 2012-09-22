ActiveAdmin.register Applicant do
  
  filter :name
  filter :email

  scope :all, :default => true
  scope :in_progress
  scope :complete
  
  index do

    column("State") {|applicant| status_tag(applicant.state)  }
    column("Name") {|applicant| link_to(applicant.name, admin_applicant_path(applicant)) }
    column :affiliation
    column :email
  end

  ### Create a button to change the state of the applicant
  action_item :only => :show do
    link_to "Check as complete", change_application_state_path(resource)
  end



end
