class UsersController < ApplicationController

  def new

  end

  def create
    User.create(params[:user])
    redirect_to root_path
  end

end
