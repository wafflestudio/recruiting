ActiveAdmin.register Applicant do
  
  filter :name
  filter :email

  scope :all, :default => true
  scope :in_progress
  scope :complete
  
  index do

    column("State") {|applicant| status_tag(applicant.state)  }
    column :name
    column :affiliation
    column :email
  end

end
