Recruiting::Application.routes.draw do
  ActiveAdmin.routes(self)

  match 'recruit/index' => 'recruit#index', :as => :home_page  
  

  # create an action to change the applicants state
  match 'recruit/changestate/:id', :controller => 'recruit', :action => 'change_state', :as => :change_application_state


  # Redirect the authentice_applicant! method's url
  match 'applicants/sign_in/', :controller => 'recruit', :action => 'index'

	get 'recruit/new' => 'recruit#new', :as => :new_applicant
	post 'recruit/create' => 'recruit#create', :as => :submit_signup_form
	post 'recruit/step2create' => 'recruit#step2create', :as => :submit_application_form
  get 'recruit/edit' => 'recruit#edit', :as => :edit_application_form
  devise_for :admin_users, ActiveAdmin::Devise.config
	
  devise_for :applicants, :controllers => {:registrations => "registrations"}

  match ':controller(/:action(/:id))(.:format)'
  root :to => 'recruit#index'

end
