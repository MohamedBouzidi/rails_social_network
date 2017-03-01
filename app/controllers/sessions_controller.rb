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
      if !@user.activated?
        flash[:info] = "Account not yet activated. Check your email for activation link"
        redirect_to root_url and return
      end
      flash[:success] = 'You have been logged in'
      log_in @user
      if @remember_user == '1'
        remember @user
      else
        forget @user
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
