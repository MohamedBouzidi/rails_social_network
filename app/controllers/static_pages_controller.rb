class StaticPagesController < ApplicationController
  def home
    if is_logged_in?
      @user = current_user
      @posts = @user.posts.paginate(page: params[:page])
      render 'users/show'
    else
      render 'home'
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
