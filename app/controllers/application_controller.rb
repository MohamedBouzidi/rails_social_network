class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if !session[:user_id].nil?
      user = User.find_by_id(session[:user_id])
    end
  end

  def is_logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id) if !session[:user_id].nil?
  end

  def logged_in_user
    unless is_logged_in?
      flash[:danger] = "You must login to complete this action"
      redirect_to login_path
    end
  end

  def current_user?(user)
    user == current_user
  end

end
