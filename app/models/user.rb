class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password

  has_many :questions
  has_many :answers

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  #REVIEW: has_secure_password already validates presence of password, look at the code(https://github.com/rails/rails/blob/b965ce361b89ad33a4a4b422f8e564233926c723/activemodel/lib/active_model/secure_password.rb#L42)
  validates :password, presence: true

  def gravatar
    Gravatar.new(self.email).image_url
  end
end

