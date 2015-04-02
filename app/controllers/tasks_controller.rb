class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task
    else
      render json: @task, status: 500
    end
  end

  def update
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:description, :placement, :completed)
  end
end
