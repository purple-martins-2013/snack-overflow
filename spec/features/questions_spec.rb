require 'spec_helper'

feature 'Question Layouts' do
  let(:user) { FactoryGirl.create :user }

  before do
     question = user.questions.create(title: "Pizza, Ricotta, Bourbon", content: "Any clue what I can make with these?")
  end

  let(:question) { question = FactoryGirl.create :question, title: "Pizza, Ricotta, Bourbon", content: "Any clue what I can make with these?" }

  context "on welcome page" do 

    it "can see a title of a question on the homepage" do 
      visit questions_path
      page.should have_content "Pizza, Ricotta, Bourbon"
    end

    it "can click the title and see the full content" do
      visit questions_path
      click_link "#{question.title}"
      page.should have_content "Any clue what I can make with these?"
    end
  end

  context "on create question form" do
    it "creates a new question" do
      sign_in(user)
      visit new_question_path
      fill_in 'question_title',   with: "Hello world!"
      fill_in 'question_content', with: "Lorem ipsum dolor sit amet"
      click_button "Save Question" 
      page.should have_content "Hello world!"
    end
  end

  context "on question show page" do
    it "creates a new answer and displays it on the question show page" do
      visit questions_path
      click_link "#{question.title}"
      fill_in 'answer_content', with: "Lorem ipsum dolor sit amet"
      click_button "Create Answer"
      page.should have_content "Lorem ipsum dolor sit amet"
    end
  end
  
end


#create new answer.