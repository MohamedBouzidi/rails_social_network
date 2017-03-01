class AccountActivationsController < ApplicationController

  def edit
    @user = User.find(params[:id])
    if @user and !@user.activated? and @user.remember_digest == params[:token]
      activate @user
      flash[:success] = "Your account has been activated successfully"
      redirect_to login_url
    else
      redirect_to root_url
    end
  end

end
