require 'spec_helper'

feature 'Question Layouts' do
  let(:user) { FactoryGirl.create :user }

  before do
     @question = FactoryGirl.create(:question, title: "Pizza, Ricotta, Bourbon", content: "Any clue what I can make with these?", user: user)
  end

  context "on welcome page" do 

    it "can see a title of a question on the homepage" do 
      visit questions_path
      page.should have_content "Pizza, Ricotta, Bourbon"
    end

    it "can click the title and see the full content" do
      visit questions_path
      click_link "#{@question.title}"
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
    context "after creating a new answer" do
      before do
        sign_in(user)
        visit questions_path
        click_link "#{@question.title}"
        fill_in 'answer_content', with: "Lorem ipsum dolor sit amet"
        click_button "Create Answer"
      end
      
      it "should have the correct answer title and score" do
        page.should have_content "Lorem ipsum dolor sit amet"
        page.should have_content "Score: 0"
      end

      context "after upvoting the answer" do
        before do
          click_link "upvote"
        end

        it "should increment the answer score" do
          page.should have_content "Score: 1"
        end
      end

      context "after downvoting the answer" do
        before do
          click_link "downvote"
        end

        it "should decrement the answer score" do
          page.should have_content "Score: -1"
        end
      end
    end
  end  
end


#create new answer.