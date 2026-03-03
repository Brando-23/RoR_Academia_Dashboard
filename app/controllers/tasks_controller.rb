class TasksController < ApplicationController
 
  def index 
    @project = current_user.assigned_projects.find(params[:project_id])
    @tasks = @project.tasks
  end

  def update
    @project = current_user.assigned_projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.update(task_params)
    respond_to do |format|
      format.js
      format.html { redirect_to project_path(@project) }
    end
  end

  def edit
    @project = current_user.assigned_projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  private 

  def task_params
    params.require(:task).permit(:title,:task_description,:status)
  end
end
