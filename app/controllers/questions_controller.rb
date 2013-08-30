class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end

  def new

  end

  def create
    Question.create(params[:question])
    redirect_to root_path
  end

  def destroy
    Question.find_by_id(params[:id]).destroy
    redirect_to user_path
  end

end
