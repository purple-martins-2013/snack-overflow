class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    User.create(params[:user])
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

end
