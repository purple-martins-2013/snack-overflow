require 'spec_helper'

describe 'visiting users profile' do
  # REVIEW: replace all instance methods with let
  before do
    @user = FactoryGirl.create(:user)
    @question_user_asked = @user.questions.create(title: "derps?", content: "How many?", )
    @question_user_answered = FactoryGirl.create(:question)
    @answer = FactoryGirl.create(:answer, {:user => @user, :question => @question_user_answered})
  end

  it "successfully visits user profile page" do
    visit user_path(@user)
    expect(page).to have_content(@user.username)
    expect(page).to have_content(@question_user_asked.title)
    expect(page).to have_content(@question_user_answered.title)
    shortened_answer_content = @answer.content.split('.').first + "..."
    expect(page).to have_content(shortened_answer_content)

  end


end




