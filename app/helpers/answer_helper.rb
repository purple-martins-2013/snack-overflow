 module AnswerHelper
  def num_answers_for_question(id)
    Answer.where(question_id: id).count
  end
end