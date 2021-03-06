class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :delete, :destroy]
  before_action :correct_user, only: [:edit, :update, :delete, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Account created successfully. check your email for activation link"
      redirect_to root_url
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
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

  def friends
    @user = User.find(params[:id])
    @active_friends = @user.active_friends
    @passive_friends = @user.passive_friends
  end

  # Both these methods should be organized further
  def friendrequest
    current_user.sent_requests.create(receiver_id: params[:id])
    user = User.find(params[:id])
    user.notifications.create(body: "#{current_user.name} requesting friendship", link: user_path(current_user))

    respond_to do |format|
      format.js { render js: "location.reload();" }
    end
  end

  def acceptrequest
    current_user.passive_relations.create(sender_id: params[:id])
    request = current_user.received_requests.where(sender_id: params[:id]).first
    request.update_column(:accepted, true)
    request.update_column(:accepted_at, Time.zone.now)

    user = User.find(params[:id])
    current_user.notifications.where(body: "#{user.name} requesting friendship").first.update_column(:checked, true)
    user.notifications.create(body: "#{current_user.name} accepted your friendship")

    respond_to do |format|
      format.js { render js: "location.reload();" }
    end
  end

  def refuserequest
    
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
