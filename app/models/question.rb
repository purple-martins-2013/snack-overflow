class Question < ActiveRecord::Base
  attr_accessible :title, :content

  validates :title, :content, :user, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy

  def number_of_answers
    self.answers.count
  end

  def owner? user
    self.user == user
  end

end
