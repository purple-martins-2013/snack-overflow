class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Success: Logged in'
      redirect_to :root
    else
      flash[:notice] = 'Error: Invalid username or password'
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to :root
  end
end
