class ProjectsController < ApplicationController

  def mark_as_featured
    @project = Project.find(params[:id])
    @project.make_featured!
    redirect_to admin_projects_path
  end






end
