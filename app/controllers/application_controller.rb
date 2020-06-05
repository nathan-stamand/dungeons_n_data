class ApplicationController < ActionController::Base
    private

    def logged_in?
        !!session[:user_id]
    end

    def current_user 
        @user = User.find_by(id: session[:user_id])
    end 

    def check
        @creator == current_user
    end

    def form_check
        if check
            render '_form'
        else
            redirect_to user_path(@creator)
        end
    end
end
