class TasksController < ApplicationController
  
  def index
    set_folder
    all_folder
    @tasks = @folder.tasks.includes(:user).rank(:row_order)
    @tasks_desc = @folder.tasks.includes(:user).order(created_at: :desc)
    @task = Task.new
  end
  
  def create
    set_folder
    @task = @folder.tasks.new(task_params)
    if @task.save
      redirect_to folder_tasks_path(@folder)
    else
      all_folder
      @tasks = @folder.tasks.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy_all
    set_folder
    @folder.tasks.destroy_all
    redirect_to folder_tasks_path(@folder), notice: 'All tasks were successfully deleted.'
  end

  def update
    set_folder
    @task = Task.find(params[:id])
    if @task.update(folder_id: 1)
      redirect_to folder_tasks_path(@folder)
    end
  end

  def sort
    @task = Task.find(params[:id])
    @task.update(row_order_position: params[:row_order_position])
    head :no_content  
  end
  
  private
  
  def set_folder
    @folder = Folder.find(params[:folder_id])
  end
  
  def all_folder
    @folders = Folder.all
  end

  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end
end
