class RecruitController < ApplicationController
  
  before_filter :check_deadline, :only => [:new, :edit, :update, :destroy, :create]
  before_filter :authenticate_applicant!, :only => [:edit, :update, :destroy]


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
	unless @applicant.save
		render "new" 
	else
		redirect_to :step2
	end

  end
  
  def edit
	@applicant = Applicant.new(params[:applicant])
	@answer = Answer.new(params[:applicant][:answer])

	if user_signed_in?
		render "edit"
	else
		redirect_to :index, :notification => "Please login"
	end

  end

	def step2
		@questions = Question.where(:order => 1)
	end


  def update 
  end

  def destroy
  
  end

  def print
  end
 


end
