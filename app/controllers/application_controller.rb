class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  helper_method :form_check
  helper_method :check
  before_action :current_user

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
      render '_form', :layout => false
    else
      redirect_to user_path(current_user)
    end
  end
end
