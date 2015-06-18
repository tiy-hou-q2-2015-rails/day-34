class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new params.require(:task).permit(:name)
    @task.save
    @tasks = Task.all
  end

  def done
    @task = Task.find params[:id]
    @task.update_attribute :done, true
    @tasks = Task.all
  end
end
