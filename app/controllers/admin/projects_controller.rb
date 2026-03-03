class Admin::ProjectsController < ApplicationController 

  def index 
    @projects = Project.all 
  end

  def show
    @project = Project.find(params[:id])
    @assigned_users = @project.users
    @unassigned_users = User.where.not(id: @assigned_users.pluck(:id)).where(admin: false)
    @tasks = @project.tasks
    @assignment = Assignment.new
  end

  def new 
    @project = Project.new 
  end

  def create 
    @project = current_user.projects.new(project_params)
    if @project.save 
      redirect_to admin_projects_path,notice: 'Project was successfully created.'
    else  
      render :new
    end
  end

  def edit 
    @project = Project.find(params[:id])
  end

  def update  
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to admin_project_path(@project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy 
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_path, notice: 'Project was successfully deleted.'
  end

private 
def project_params
  params.require(:project).permit(:title,:description)
end
end
