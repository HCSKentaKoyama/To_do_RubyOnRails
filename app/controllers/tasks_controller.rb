class TasksController < ApplicationController
    require 'date'

    before_action :authenticate_user, {only: [:index]}
    # before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

    def index
        @tasks = Task.where(user_id: @current_user.id)
    end

    def create
        @task = Task.new(
            task_name: params[:task_name],
            #due_date: Date.new(params["due_date(1i)"]&.to_i, params["due_date(2i)"]&.to_i, params["due_date(3i)"]&.to_i),
            #execution_date: Date.new(params["execution_date(1i)"]&.to_i, params["execution_date(2i)"]&.to_i, params["execution_date(3i)"]&.to_i),
            due_date: Date.new(2019, 6, 25),
            execution_date: Date.new(2019, 6, 25),
            user_id: @current_user.id
        )
        if @task.save
            flash[:notice] = "タスクを追加"
        else
            flash[:notice] = "なんか登録できなかった"
        end
        redirect_to("/index")
    end
end
