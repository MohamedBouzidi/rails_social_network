module UsersHelper

  def current_user
    if !session[:user_id].nil?
      user = User.find_by_id(session[:user_id])
    end
  end

  def is_logged_in?
    !current_user.nil? and !session[:user_id].nil?
  end

end
