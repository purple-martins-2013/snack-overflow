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
      before do
        session[:user_id] = user.id
      end

      context "with title and content filled" do
        it "should create a question" do
          expect { post :create, { question: attributes_for(:question) } }.to change{Question.all.last}
        end
      end

      context "when form is not filled out" do
        it "should not create a question" do
          expect { post :create, { } }.not_to change{Question.all.last}
        end

        it "should raise an error" do
          post :create, { content: {} }
          expect(response.status).to eq 422
        end
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
