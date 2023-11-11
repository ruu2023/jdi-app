class TasksController < ApplicationController
  
  def index
    @folders = Folder.all
    @task = Task.new
    set_folder
  end
  
  def create
    set_folder
    @task = @folder.tasks.new(task_params)
    if @task.save
      redirect_to folder_tasks_path(@folder)
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private
  
  def set_folder
    @folder = Folder.find(params[:folder_id])
  end

  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end
end
