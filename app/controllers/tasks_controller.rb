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

  # def update
  #   set_folder
  #   @task = Task.find(params[:id])
  #   if @task.update(folder_id: 1)
  #     redirect_to folder_tasks_path(@folder)
  #   end
  # end

  def sort
    @task = Task.find(params[:id])
    @task.update(row_order_position: params[:row_order_position])
    head :no_content  
  end

  def mark_as_done
    task = Task.find(params[:id])
    done_task = Done.create(task: task) # Doneモデルに新しいレコードを作成し、関連付けられたタスクを渡す
    task.destroy # タスクを削除するか、もしくは「done」状態にマークする方法を選択
    redirect_to tasks_path, notice: 'Task marked as done successfully.'
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
