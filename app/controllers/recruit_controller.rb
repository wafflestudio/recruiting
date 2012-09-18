class RecruitController < ApplicationController
  
  before_filter :check_deadline, :only => [:new, :edit, :update, :destroy, :create]
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy]


  def check_deadline
    true
  end


  def index
    @projects = Project.all.sort("date_started DESC")

  end

  def new
    @applicant = Applicant.new
    ## TODO AdminConfig current_order
    #@questions = Question.where(:order => current_order).sort("priority ASC")
  end

  def create  
  
  end
  
  def edit
  end

  def update 
  end

  def destroy
  
  end

  def print
  end
 


end
