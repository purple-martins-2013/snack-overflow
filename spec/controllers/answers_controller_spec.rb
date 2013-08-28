require 'spec_helper'

describe AnswersController do
  let(:answer) { FactoryGirl.create :answer, content: "Ants on a log" }

  describe "#create" do
    it { should route(:post, '/answers').to(action: :create) }
  end

  describe "#destroy" do
    it { should route(:delete, '/answers/1').to(action: :destroy, id: 1) }
  end
  
end