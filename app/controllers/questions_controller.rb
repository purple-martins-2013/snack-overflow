class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end

  def new
    p "*" * 88
    p params
    Question.new(title: params[:title], content: params[:content])
  end

  # def create
  #   p "&" * 88
  #   p params
  #   Question.create(title: params[:title], content: params[:content])
  # end


end