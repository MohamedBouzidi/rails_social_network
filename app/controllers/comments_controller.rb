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
    @comment.save

    respond_to do |format|
      format.js { render :js => "location.reload();" }
    end
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
