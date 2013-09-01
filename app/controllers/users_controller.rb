class UsersController < ApplicationController
  include UserHelper

  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    if user.errors.messages.empty?
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = 'Error signing up'
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
