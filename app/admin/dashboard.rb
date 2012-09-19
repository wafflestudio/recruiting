ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    panel "Recent Applicants" do
      table_for Applicant.all do
        column("name")  {|applicant| link_to(applicant.name, admin_applicant_path(applicant)) }
        column("affiliation") 
      end
    end
  
  
  
  end # content

end
