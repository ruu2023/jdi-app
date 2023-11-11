class TasksController < ApplicationController
  
  def index
    set_folder
    @folders = Folder.all
    @tasks = @folder.tasks.includes(:user)
    @task = Task.new
  end
  
  def create
    set_folder
    @task = @folder.tasks.new(task_params)
    if @task.save
      redirect_to folder_tasks_path(@folder)
    else
      @tasks = @folder.tasks.include(:user)
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
