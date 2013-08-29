require 'spec_helper'

describe QuestionsController do
  let(:question) { FactoryGirl.create :question, title: "Pizza, Ricotta, Bourbon", content: "Any clue what I can make with these" }
  

  describe "#index" do
    it { should route(:get, '/').to(action: :index) }
  end

  describe "#show" do
    it { should route(:get, '/questions/1').to(action: :show, id: 1) }
  end

  describe "#new" do
    it { should route(:get, '/questions/new').to(action: :new) }
  end

  describe "#create" do
    it { should route(:post, '/questions').to(action: :create) }
  end

  describe "#destroy" do
    it { should route(:delete, '/questions/1').to(action: :destroy, id: 1) }
  end
  
end