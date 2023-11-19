class TasksController < ApplicationController
  
  def index
    @tasks = Task.includes(:user).rank(:row_order)
    @tasks_desc = Task.includes(:user).order(created_at: :desc)
    @task_all = Task.all
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    binding.pry
    if @task.save
      redirect_to root_path
    else
      @tasks = Task.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy_all
    Task.delete_all
    redirect_to root_path, notice: 'All tasks were successfully deleted.'
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
    done_task = Archive.create(task: task) # Doneモデルに新しいレコードを作成し、関連付けられたタスクを渡す
    task.destroy # タスクを削除するか、もしくは「done」状態にマークする方法を選択
    redirect_to root_path, notice: 'Task marked as done successfully.'
  end
  
  private
  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end
end
