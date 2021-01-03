class Api::TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      @user = current_user
      @tasks = @user.tasks.order('created_at DESC')
    end

    def create
      @task = Task.new(task_params)
      @task.user_id = current_user.id
      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def destroy
      Task.find(params[:id]).destroy!
    end

    def update
      Task.find(params[:id]).toggle!(:is_done)
    end

    private def task_params
      params.require(:task).permit(:name, :is_done)
    end
end
