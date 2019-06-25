class TasksController < ApplicationController
    before_action :authenticate_user, {only: [:index]}
    # before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

    def index
        @tasks = Task.where(user_id: @current_user.id)
    end

    def create
        @task = Task.new(
            task_name: params[:task_name],
            due_date: params[:due_date],
            execution_date: params[:execution_date]
        )
        if @task.save
            flash[:notice] = "タスクを追加"
        else
            flash[:notice] = "なんか登録できなかった"
        end
        redirect_to("/index")
    end
end
