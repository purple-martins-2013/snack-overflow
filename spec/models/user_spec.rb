require 'spec_helper'

describe User do
  let(:test_user) { FactoryGirl.create :user, :username => 'shadi' }

  context "validations" do
    it { should validate_uniqueness_of :username }
    it { should validate_uniqueness_of :email }
  end

  context "username" do
    it { should respond_to :username }
  end
end
