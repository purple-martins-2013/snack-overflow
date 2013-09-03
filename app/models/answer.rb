class Answer < ActiveRecord::Base
  attr_accessible :content, :score, :question_id

  validates :content, presence: true

  DEFAULT_SCORE = 0
  before_create { self.score = 0 }

  belongs_to :user
  belongs_to :question

  def shortened_content
    content.split('.').first + "..."
  end

  def upvote!
    self.update_attributes(score: self.score + 1)
  end

  def downvote!
    self.update_attributes(score: self.score - 1)
  end

end
