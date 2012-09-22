class RecruitController < ApplicationController
  
  before_filter :check_deadline, :only => [:new, :edit, :update, :destroy, :create]

  # TODO change the redirect URL of the authenticate_applicant helper
  before_filter :authenticate_applicant!, :only => [:edit, :update, :destroy, :step2, :step2create, :step2edit, :step2update]


  def check_deadline
    true
  end


  def index
    @projects = Project.order("date_started DESC")

  end

  def new
    @applicant = Applicant.new
    ## TODO AdminConfig current_order
    #@questions = Question.where(:order => current_order).order("priority ASC")
  end

  def create
    
    @applicant = Applicant.new(params[:applicant])
    if @applicant.save
      sign_in(@applicant)
      redirect_to :controller => :recruit, :action => "step2" 
    else
      render "new", :alert => "Please check the errors"
    end
  end
  
  def edit
	@applicant = Applicant.new(params[:applicant])
	@answer = Answer.new(params[:applicant][:answer])

	if applicant_signed_in?
		render "edit"
	else
		redirect_to :index, :notification => "Please login"
	end

  end

	def step2
    # TODO Create current_order helper to access the current_order from the admin config
    @questions = Question.where(:order => 1).order("priority asc")
    @current_applicant = current_applicant
    if applicant_signed_in?
      render "step2"
    else
      redirect_to "index", :alert => "login required"
    end

	end

  def step2create
    # TODO Check for the user session and current_user
#    {"utf8"=>"✓",
#       "authenticity_token"=>"hiPVNsIjBsGh3Kw2c4xayBwvze3bkbz5NnuSZK43VhE=",
#        "answers"=>{"1"=>"Arif",
#           "2"=>"Afghanistan",
#            "3"=>"I am ...."},
#             "commit"=>"Submit Your Application"}



    answers = params[:answers]
    answers.each do |question_id, answer| 
      temp = Answer.new
      temp.applicant_id = current_applicant.id
      temp.question_id = question_id
      temp.content = answer
      temp.save
      # TODO Check if the answer is saved correctly. If not render back
      # the application form to the applicant
    end
    
    # TODO Decide about the redirected URL after the sucessfull save in the database
    redirect_to home_page_path  #, :notice => "Successfully Submitted"
  end

  def step2edit
  end
  
  def step2update

  end


  def update 
  # TODO after the successfull update of the login data 
  # redirect the applicant to the step2edit page
 
  end

  def destroy
  
  end

  def print
  end
 
  def change_state
    applicant = Applicant.find(params[:applicant])
    applicnat.process!
    redirect_to admin_applicants_path 
  end


end
