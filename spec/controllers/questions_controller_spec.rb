require 'spec_helper'

describe QuestionsController do
  let(:question) { FactoryGirl.create :question, title: "Pizza, Ricotta, Bourbon", content: "Any clue what I can make with these" }
  let(:user) { FactoryGirl.create :user }
  
  describe "#index" do
    it { should route(:get, '/').to(action: :index) }

    it "should set variable to all questions" do
      get 'index'
      assigns(:questions).should eq Question.all
    end
  end

  describe "#show" do
    it { should route(:get, '/questions/1').to(action: :show, id: 1) }

    it "should set variable to specific question" do
      get "show", { :id => question.id }
      assigns(:question).should_not be_nil
    end
  end

  describe "#new" do
    it { should route(:get, '/questions/new').to(action: :new) }
  end

  describe "#create" do
    it { should route(:post, '/questions').to(action: :create) }

    context "when user is logged in" do
      it "should create a question" do
        session[:user_id] = user.id
        expect { post :create, { question: attributes_for(:question) } }.to change{Question.all.last}
      end
    end

    context "When user is not logged in" do
      it "should not create a question" do
        session[:user_id] = nil
        expect { post :create, { question: attributes_for(:question) } }.not_to change{Question.all.last}
      end
    end
  end

  describe "#destroy" do
    it { should route(:delete, '/questions/1').to(action: :destroy, id: 1) }

    it "should destroy a question" do
      delete :destroy, :id => question.id
      Question.find_by_id(question.id).should be_nil
    end
  end  
end
