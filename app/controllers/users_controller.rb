class UsersController < ApplicationController
    before_action :authenticate_user, {only: [:index]}
    before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

    def login
        @user = User.find_by(user_name: params[:user_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/index")
        else
            @error_message = "ユーザIDまたはパスワードが間違っています"
            @user_name = params[:user_name]
            @password = params[:password]
            render("users/login_form")
        end
    end

    def login_form
        @user = User.new
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(
            user_name: params[:user_name],
            password: params[:password]
        )
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "ユーザ登録が完了しました"
            redirect_to("/index")
        else
            @error_message = "登録できなかったよ"
            @user_name = params[:user_name]
            @password = params[:password]
            render("users/create_form")
        end
    end
end
