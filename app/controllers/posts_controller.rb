class PostsController < ApplicationController
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

  private

    def post_params
      params.require(:post).permit(:body)
    end
end
