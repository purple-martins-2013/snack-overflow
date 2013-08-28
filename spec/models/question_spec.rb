require 'spec_helper'

describe Question do
  let(:question) { question = Question.new(title: "Want good food.", content: "I have raisins, celery and PB. What can I make?") }
  
  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should belong_to :user }
  end

  context "Belongs in Question" do
    it "has a title" do
      question.title.should eq "Want good food."
    end 

    it "has the right content" do
      question.content.should eq "I have raisins, celery and PB. What can I make?"
    end
  end

end
