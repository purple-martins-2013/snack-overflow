require 'spec_helper'

describe Answer do
  let(:test_answer) { FactoryGirl.create :answer }

  context "validations" do
    it { should validate_presence_of :content }
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

  context "content" do
    it { should respond_to :content }
  end

  context "score" do
    it { should respond_to :score }

    it "should have the correct default value" do
      test_answer.score.should eq 0
    end
  end
end
