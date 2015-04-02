class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:placement)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    @task.update(placement: Task.count)

    if @task.save
      render json: @task
    else
      render json: @task, status: 500
    end
  end

  def update

  end

  def swap
    @task = Task.find(params[:id])

    if params[:direction]
      Task.swap(@task, params[:direction].to_i)
    end

    render json: Task.all.order(:placement)
  end

  def destroy
    Task.find(params[:id]).destroy
    Task.all.order(:placement).each_with_index do |task, index|
      task.update(placement: index)
    end
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :placement, :completed)
  end
end
