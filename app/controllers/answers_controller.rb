class AnswersController < ApplicationController
  include AnswerHelper
  before_filter :logged_in?, only: :create
  before_filter :load_question

  def create
    @answer = current_user.answers.build(params[:answer])
    if @answer.save
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end

  def increment
    answer = Answer.find(params[:id])
    answer.upvote!
    redirect_to @question
  end

  def decrement
    answer = Answer.find(params[:id])
    answer.downvote!
    redirect_to @question # you can also do redirect :back
  end

  def destroy
    Answer.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

  private
  def load_question
    @question = Question.find(params[:question_id])
  end
end
