class QuestionsController < ApplicationController

  before_filter :logged_in?, only: :create

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
    @answers = @question.answers.order("score DESC").select(&:persisted?)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(params[:question])
    if @question.persisted?
      redirect_to question_path(@question)
    else
      render :new # make sure that the error partial is included in the new view
    end
  end

  def destroy
    Question.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end
