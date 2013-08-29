class Answer < ActiveRecord::Base
  attr_accessible :content, :score, :question_id

  validates :content, presence: true

  before_create { self.score = 0 }

  belongs_to :user
  belongs_to :question

  def shortened_content
    content.split('.').first + "..."
  end

end
