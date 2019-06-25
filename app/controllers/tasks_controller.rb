class TasksController < ApplicationController
    before_action :authenticate_user, {only: [:index]}
    # before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

    def index
        @tasks = Task.where(user_id: @current_user.id)
    end
end
