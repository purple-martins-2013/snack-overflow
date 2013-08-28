class UsersController < ApplicationController

  def new

  end

  def create
    User.create(params)
    redirect_to root_path
  end

end
