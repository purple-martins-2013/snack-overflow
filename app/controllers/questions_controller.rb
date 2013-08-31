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
    Question.create(params[:question], user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    redirect_to user_path
  end

end
