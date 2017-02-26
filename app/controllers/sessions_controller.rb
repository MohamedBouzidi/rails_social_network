class SessionsController < ApplicationController

  def new
    if is_logged_in?
      redirect_to root_url
    end
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    @remember_user = params[:user][:remember_me]
    if !@user.nil? and @user.authenticate(params[:user][:password])
      flash[:success] = 'You have been logged in'
      log_in @user
      if @remember_user == '1'
        remember @user
      else
        forget
      end
      redirect_to root_url 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'sessions/new'
    end
  end

  def delete
    if is_logged_in?
      log_out
    end
    redirect_to root_url
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
