require 'spec_helper'

describe Question do
  let(:title) { "Want good food." }
  let(:content) { "I have raisins, celery and PB. What can I make?" }
  let(:question) { create :question, title: title, content: content}

  context "associations" do
    it { should belong_to :user }
    it { should have_many :answers}
  end

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :user_id }
  end

  # REVIEW: you're testing active record, remove lines 20-27
  context "Attributes of a Question" do
    it "has a the right title" do
      question.title.should eq title
    end

    it "has the right content" do
      question.content.should eq content
    end
  end

end
