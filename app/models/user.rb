class User < ActiveRecord::Base
  attr_accessible :username, :email, :password_hash

  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
