class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(params[:answer])
    if @answer.persisted?
      redirect_to question_path(@question)
    else
      render "questions/show", status: :unprocessable_entity
    end
  end

  def increment
    answer = Answer.find(params[:id])
    answer.upvote!
    redirect_to question_path(params[:question_id])
  end

  def decrement
    answer = Answer.find(params[:id])
    answer.downvote!
    redirect_to question_path(params[:question_id])
  end

  def destroy
    Answer.find_by_id(params[:id]).destroy
    redirect_to root_path
  end


end
