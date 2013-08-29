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

  describe "shortened_content" do
    it "is the first sentence followed by ellipses" do
      test_answer = FactoryGirl.build(:answer, {content: "This is a sentence. So is this."})
      test_answer.shortened_content.should eq("This is a sentence...")
    end
  end

end
