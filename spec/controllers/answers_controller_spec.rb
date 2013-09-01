require 'spec_helper'

describe AnswersController do
  let(:answer) { create :answer }
  let(:question) { create :question }

  describe "#create" do
    it { should route(:post, '/questions/1/answers').to(action: :create, question_id: 1) }

    context "when I try to create an answer with empty params" do
      it "should raise an error" do
        post :create, { content: { }, question_id: question.id }
        expect(response.status).to eq 422
      end

      it "renders the questions/show page" do
        post :create, { content: { }, question_id: question.id }
        expect(response).to render_template "questions/show"
      end
    end

    context "when I try to create an answer with complete params" do
      it "should redirect back to question page with answer posted" do
        post :create, { answer: attributes_for(:answer), question_id: question.id }
        expect(response).to redirect_to(question_path(question))
      end

    end
  end

  describe "#increment" do
    it { should route(:put, '/questions/1/answers/1/increment').to(action: :increment, question_id: 1, id: 1) }

    it "should update the score of an answer" do
      put :increment, { question_id: question.id, id: answer.id }
      Answer.find_by_id(answer.id).score.should eq 1
    end
  end

  describe "#destroy" do
    it { should route(:delete, '/answers/1').to(action: :destroy, id: 1) }

    it "should destroy an answer" do
      delete :destroy, :id => answer.id
      Answer.find_by_id(answer.id).should be_nil
    end
  end
end
