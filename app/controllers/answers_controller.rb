class AnswersController < ApplicationController

  def create
    p '8'* 88
    p @question
    Answer.create(params[:answer])
    redirect_to :back
  end

  def destroy
    
  end


end