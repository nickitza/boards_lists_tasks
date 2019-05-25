class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  
  def index
    @tasks = @list.tasks
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :not_complete, :priority)
  end

end
