class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    p "*" * 88
    p params
    @questions = Question.find(params[:id])
  end

  # def new
  #   Question.new(title: params[:title], content: params[:content])
  # end

  # def create

  # end


end