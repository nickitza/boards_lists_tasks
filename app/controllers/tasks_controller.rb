class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  
  def index
    @tasks = @list.tasks
  end

  def show
  end

  def edit
    render :edit
  end

  def update
    if @task.update(task_params)
      redirect_to list_tasks_path(@list)
    else
      render :edit
    end
  end

  def new
    @task = @list.tasks.new()
    render :new
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_tasks_path(@list)
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path(@list)
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
