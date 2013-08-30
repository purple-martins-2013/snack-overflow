class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end

  def new
  #   p "*" * 88
  #   p params
  #   Question.new(title: params[:title], content: params[:content])
  end

  def create
    Question.create(params[:question])
    redirect_to root_path
  end

  def destroy
    redirect_to user_path
  end

end
