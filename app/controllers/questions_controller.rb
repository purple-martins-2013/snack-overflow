class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
    @answers = @question.answers.select{|e|e.id}
  end

  def new
    @question = Question.new
  end

  def create
    current_user.questions.create(params[:question])
    redirect_to root_path
  end

  def destroy
    Question.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end
