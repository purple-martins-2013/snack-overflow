class AnswersController < ApplicationController

  def create
    @answer = Answer.create(params[:answer])
    redirect_to :back
  end

  def destroy
    
  end


end