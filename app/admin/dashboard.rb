ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do

      column do
        panel "Recent Applicants" do
          table_for Applicant.order('name desc').limit(10) do 
            column("State") {|applicant| status_tag(applicant.state)  }
            column("Name") {|applicant| link_to(applicant.name, admin_applicant_path(applicant)) }
            column :email
          end
        end
      end

      column do

        panel "Set the deadline" do
        end

        panel "Set the current Order" do
        end


      end # column2


    end

  





#    panel "Recent Applicants" do
#      table_for Applicant.all do
#        column("name")  {|applicant| link_to(applicant.name, admin_applicant_path(applicant)) }
#        column("affiliation") 
#      end
#    end
#
#    panel "Add a Question" do
#       
#
#    end
#
  
    
  

  end # content

end
