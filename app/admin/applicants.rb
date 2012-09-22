ActiveAdmin.register Applicant do

  # Block the admin to edit or destroy the application
  actions :all, :except => [:edit, :destroy, :new]

  filter :name
  filter :email

  scope :all, :default => true
  scope :in_progress
  scope :complete

  sidebar :applicant_stats, :partial => "applicant_stats"


  index do

    column("State") {|applicant| status_tag(applicant.state)  }
    column("Name") {|applicant| link_to(applicant.name, admin_applicant_path(applicant)) }
    column :affiliation
    column :email
  end

  ### Create a button to change the state of the applicant at the show page
  action_item :only => :show do
    link_to "Check as complete", change_application_state_path(resource)
  end
 
  action_item :only => :show do
    link_to "Back to Applicants", admin_applicants_path
  end


  show do |ad|
    @current_applicant = Applicant.find(params[:id])
    @current_questions = Question.where("order = ?", @current_applicant.order)

    attributes_table do
      row :name
      row :email
      row :phone
      row :affiliation
      row :created_at
      row :processed
      row :order
    end

    render :partial => "show_answers", :locals => {:current_applicant => @current_applicant, :current_questions => @current_questions}
    
    active_admin_comments
  end



end










