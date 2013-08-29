require 'spec_helper'

feature 'Question Layouts' do 
  before do
     question = Question.create(title: "Pizza, Ricotta, Bourbon", content: "Any clue what I can make with these?")
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
  
end