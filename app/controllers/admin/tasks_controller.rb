class Admin::TasksController < ApplicationController
  def new 
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new 
  end

  def create 
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    if @task.save 
      redirect_to admin_project_path(@project), notice: 'Task was successfully created.'
    else 
      render :new
    end
  end

  def edit 
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update 
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to admin_project_path(@project), notice: 'Task was successfully updated.'
    else 
      render :edit
    end
  end

  def destroy 
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to admin_project_path(@project), notice: 'Task was successfully deleted.'
  end
private

def task_params
  params.require(:task).permit(:title, :task_description, :status)
end
 
end