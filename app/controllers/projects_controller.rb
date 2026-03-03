class ProjectsController < ApplicationController
  def index
    @projects = current_user.assigned_projects
  end

  def show
    @project = current_user.assigned_projects.find(params[:id])
    @tasks = @project.tasks
  end

end
