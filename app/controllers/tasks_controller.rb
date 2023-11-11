class TasksController < ApplicationController
  def index
    @folders = Folder.all
  end
end
