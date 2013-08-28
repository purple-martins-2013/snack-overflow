require 'spec_helper'

describe Question do
  let(:question) { question = Question.new(title: "Want good food.", content: "I have raisins, celery and PB. What can I make?") }
  context "Belongs in Question" do
    it "has a title" do
      question.title.should eq "Want good food."
    end 
  end

end
