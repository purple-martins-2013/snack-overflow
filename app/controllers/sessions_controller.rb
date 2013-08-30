class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to sign_in_path
    end
  end
end
