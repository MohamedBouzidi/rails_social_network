class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @posts = @user.posts.paginate(page: params[:page])
  end

  def about
  end

  def help
  end

  def contact
  end
end
