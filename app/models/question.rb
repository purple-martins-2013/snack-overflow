class Question < ActiveRecord::Base
  attr_accessible :title, :content

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy


end
