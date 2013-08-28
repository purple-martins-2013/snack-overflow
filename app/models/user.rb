class User < ActiveRecord::Base
  attr_accessible :username, :email, :password_hash

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :password_hash, presence: true
end
