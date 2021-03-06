class SessionsController < ApplicationController 

  def new
    render "users/login"
  end
  
  def create 
    @user = User.find_by(username: params[:user][:username])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      flash[:message] = "Sorry, login info was incorrect. Please try again."
      redirect_to users_login_path 
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  def omniauth
    @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
      u.username = auth[:info][:email]
      u.password = SecureRandom.hex
      u.uid = auth[:uid]
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private 

  def auth 
    request.env['omniauth.auth']
  end
end
