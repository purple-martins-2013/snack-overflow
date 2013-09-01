module ApplicationHelper
  def current_user
    return User.find(session[:user_id]) if session[:user_id]
    nil
  end

  def logged_in?
  	redirect_to root_path unless current_user
  end
end
