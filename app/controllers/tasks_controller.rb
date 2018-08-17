class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]
  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to projects_path, notice: "Task was successfully destroyed" }
      format.json { head :no_content }
    end
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_description, :deadline)
  end
end
