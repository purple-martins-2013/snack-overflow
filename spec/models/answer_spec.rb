require 'spec_helper'

describe Answer do
  let(:test_answer) { create :answer, content: "This is a sentence. So is this." }

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
      test_answer.score.should eq Answer::DEFAULT_SCORE
    end

    it "should increment the score" do
      test_answer.upvote!
      test_answer.score.should eq 1
    end

    it "should decrement the score" do
      expect {
        test_answer.downvote!
      }.to change {test_answer.score}.from(0).to(-1)
    end
  end

  describe "shortened_content" do
    it "is the first sentence followed by ellipses" do
      test_answer.shortened_content.should eq("This is a sentence...")
    end
  end

end
