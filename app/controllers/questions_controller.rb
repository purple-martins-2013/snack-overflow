class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

  def new

  end

  def create
    Question.create(params[:question])
    redirect_to root_path
  end

end
