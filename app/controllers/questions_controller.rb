class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  # def new
  #   Question.new(title: params[:title], content: params[:content])
  # end

  # def create

  # end


end