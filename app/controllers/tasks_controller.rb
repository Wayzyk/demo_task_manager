class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]
  def create
    @task = @project.task.create(task_params)
    redirect_to @project
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted"
    else
      flash[:error] = "Task couldn't deleted"
    end
    redirect_to root_path
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_description)
  end
end