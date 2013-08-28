require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.create :question, title: "Want good food.", content: "I have raisins, celery and PB. What can I make?" }
  
  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should belong_to :user }
  end

  context "Attributes of a Question" do
    it "has a the right title" do
      question.title.should eq "Want good food."
    end 

    it "has the right content" do
      question.content.should eq "I have raisins, celery and PB. What can I make?"
    end
  end

end
