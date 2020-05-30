class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render new_user_path
        end
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    def login
        if !!params[:user]
            @user = User.find_by(username: params[:user][:username])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else 
                render users_login_path
            end
        else 
            @user = User.new
        end
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end
end
