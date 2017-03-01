class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :delete, :destroy]
  before_action :logged_in, only: [:like, :dislike]

  def new
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created successfully"
      redirect_to root_url
    else
      redirect_back :back
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
    if @post.destroy
      flash[:info] = 'Post destroyed successfully'
      redirect_to root_url
    else
      redirect_to root_url
    end
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
      if !current_user?(self.user)
        flash[:danger] = "You are not allowed to perform this action"
        redirect_to root_url
      end
    end

    def logged_in
      if !current_user
        flash[:info] = "You must login to complete this action"
        redirect_to login_path
      end
    end
end
