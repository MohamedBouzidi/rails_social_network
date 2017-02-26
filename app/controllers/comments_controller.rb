class CommentsController < ApplicationController
  before_action :redirect_user, only: [:new, :edit, :update, :show, :delete]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def delete
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(user_id: current_user.id, body: params[:comment][:body])
    if @comment.save
      flash[:success] = "Comment created successfully"
    else
      flash[:danger] = "Failed to create comment"
    end
    redirect_to user_url(@post.user)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:info] = "Comment destroyed"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private

    def redirect_user
      redirect_to root_url
    end
end
