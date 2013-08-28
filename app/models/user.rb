class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :password, presence: true
end


  # def show
  #   user = User.find_by_username(params[:username])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_url, :notice => 'logged in'
  #   else
  #     flash.now.alert = "Invalid username or password"
  #     render "new"
  #   end
  # end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_url, notice => 'Logged out'
  # end
