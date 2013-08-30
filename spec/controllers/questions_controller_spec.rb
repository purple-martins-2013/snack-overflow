require 'spec_helper'

describe QuestionsController do
  let(:question) { FactoryGirl.create :question, title: "Pizza, Ricotta, Bourbon", content: "Any clue what I can make with these" }
  
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
      assigns(:questions).should_not be_nil
    end
  end

  describe "#new" do
    it { should route(:get, '/questions/new').to(action: :new) }
  end

  describe "#create" do
    it { should route(:post, '/questions').to(action: :create) }

    it "should create a question" do 
      post "create"
      expect { Question.create(attributes_for :question) }.to change{ Question.all.length }.by(1)
    end
  end

  describe "#destroy" do
    it { should route(:delete, '/questions/1').to(action: :destroy, id: 1) }

    it "should destroy a question" do
      expect { delete :destroy, :id => question.id }.should change{Question.all.length}.by(1)
    end
  end  
end
