class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :logged_in, only: [:like, :dislike]

  def new
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.build(post_params)
    @post.save
    
    respond_to do |format|
      format.js { render :js => "location.reload();" }
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    render 'static_pages/home'
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = 'Post updated successfully'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post deleted successfully'
    redirect_to root_url
  end

  def like
    @post = Post.find(params[:id])
    @like = @post.likes.build(user_id: current_user.id)
    if @like.valid?
      @like.save
    end
    redirect_to :back
  end

  def dislike
    @post = Post.find(params[:id])
    @like = @post.likes.find_by_user_id(current_user.id)
    if !@like.nil?
      @like.destroy
    end
    redirect_to :back
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redierct_to root_url if @post.nil?
    end

    def logged_in
      if !current_user
        flash[:info] = "You must login to complete this action"
        redirect_to login_path
      end
    end
end
