Recruiting::Application.routes.draw do
  ActiveAdmin.routes(self)

  root :to => 'recruit#index'
  match 'recruit/index' => 'recruit#index', :as => :home_page  

  # To mark a project as a featured project
  post 'projects/mark_as_featured/:id' => 'projects#mark_as_featured', :as => :mark_project_as_featured

  # Disable the default page for creating applicants made by devise and redirect to our index page
  match 'applicants/sign_up' => 'recruit#new'
  

  # create an action to change the applicants state
  match 'recruit/changestate/:id', :controller => 'recruit', :action => 'change_state', :as => :change_application_state


  # Redirect the authentice_applicant! method's url
  get 'applicants/sign_in/', :controller => 'recruit', :action => 'index'
  

	get 'recruit/new' => 'recruit#new', :as => :new_applicant
	post 'recruit/create' => 'recruit#create', :as => :submit_signup_form
	post 'recruit/step2create' => 'recruit#step2create', :as => :submit_application_form
  get 'recruit/edit' => 'recruit#edit', :as => :edit_application_form
  devise_for :admin_users, ActiveAdmin::Devise.config
	
  devise_for :applicants, :controllers => {:registrations => "registrations"}

  match ':controller(/:action(/:id))(.:format)'

end
