TASKS = ["be cool", "be calm", "be collected", "lose your ever-loving mind"]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      redirect_to tasks_path
      head :not_found
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
        name: params[:task][:name],
        description: params[:task][:description],
        completed_at: params[:task][:completed_at])

    if @task.save
      redirect_to task_path(@task)
      return
    else
      render :new
      return
    end
  end
end
