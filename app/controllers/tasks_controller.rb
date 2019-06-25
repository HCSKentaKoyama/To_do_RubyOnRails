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
            due_date: Date.new(params[:due_date]["date(1i)"].to_i, params[:due_date]["date(2i)"].to_i, params[:due_date]["date(3i)"].to_i),
            execution_date: Date.new(params[:execution_date]["date(1i)"].to_i, params[:execution_date]["date(2i)"].to_i, params[:execution_date]["date(3i)"].to_i),
            user_id: @current_user.id
        )
        if @task.save
            flash[:notice] = "タスクを追加"
        else
            flash[:notice] = "なんか登録できなかった"
        end
        redirect_to("/index")
    end

    def done
        task = Task.find_by(id: params[:id])
        task.done_flg = true
        task.save
        redirect_to("/index")
    end
end
