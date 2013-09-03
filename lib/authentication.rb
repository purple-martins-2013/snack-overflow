module Authentication
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login user
    session[:user_id] = user.id
  end

  def logged_in?
    redirect_to root_path unless current_user
  end
end
