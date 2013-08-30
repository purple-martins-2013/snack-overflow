class SessionsController < ApplicationController

  def new
    @user = User.new
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

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
