class TasksController < ApplicationController

  def index
    @tasks = Task.includes(:user).where(user_id: current_user.id).rank(:row_order)
    @archives = Archive.includes(:user).where(user_id: current_user.id).order(created_at: :desc)
    @task = Task.new
  end

  def response_data
    tasks = Task.includes(:user).where(user_id: current_user.id).rank(:row_order)
    archives = Archive.includes(:user).where(user_id: current_user.id).order(created_at: :desc)
    arrayTask = []
    arrayArchive = []
    tasks.each do |task|
      arrayTask.push(task.content)
    end
    archives.each do |archive|
      arrayArchive.push(archive.content)
    end
    data = { tasks: arrayTask, archives: arrayArchive } # レスポンスデータ
    render json: data # JSON形式でデータを返す
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      @tasks = Task.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      redirect_to root_path, alert: 'Fail update'
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  def destroy_task_item
    Task.where(user_id: current_user.id).delete_all
    redirect_to root_path, notice: 'All tasks were successfully deleted.'
  end

  def destroy_archive_item
    Archive.where(user_id: current_user.id).delete_all
    redirect_to root_path, notice: 'All tasks were successfully deleted.'
  end

  def sort
    @task = Task.find(params[:id])
    @task.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  def mark_as_done
    task = Task.find(params[:id])
    Archive.create(user_id: task.user_id, content: task.content)
    task.destroy
    redirect_to root_path, notice: 'Done successfully.'
  end

  private
  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end

end
