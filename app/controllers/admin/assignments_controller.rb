class Admin::AssignmentsController < ApplicationController

  def create 
    @assignment = Assignment.new(assignment_params)
    if @assignment.save 
      redirect_to admin_project_path(@assignment.project), notice: 'User was successfully assigned to the project.'
    else 
      redirect_to admin_project_path(@assignment.project), alert: 'Failed to assign user to the project.'
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to admin_project_path(@assignment.project), notice: 'User was successfully unassigned from the project.'
  end

  private 
  def assignment_params
    params.require(:assignment).permit(:user_id, :project_id)
  end
end
