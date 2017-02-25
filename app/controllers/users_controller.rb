class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :delete, :destroy]
  before_action :correct_user, only: [:edit, :update, :delete, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully"
      redirect_to root_url
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'User details updated successfully'
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    ###### Before filters ######
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
