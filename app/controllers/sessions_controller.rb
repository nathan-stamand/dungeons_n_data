class SessionsController < ApplicationController 

  def create 
    @user = User.find_by(username: params[:user][:username])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      flash[:message] = "Sorry, login info was incorrect. Please try again."
      redirect_to login_path 
    end
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