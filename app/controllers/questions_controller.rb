class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

  def new
    @question = Question.new
  end

  def create

    params[:question].delete(:user_id)
    Question.create(params[:question])
    redirect_to root_path
  end

  def destroy
    Question.find_by_id(params[:id]).destroy
    redirect_to user_path
  end

end
