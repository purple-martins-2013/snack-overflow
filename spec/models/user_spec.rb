require 'spec_helper'

describe User do
  let(:test_user) { FactoryGirl.create :user, :username => 'shadi' }

  context "validations" do
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :email }
    it { should allow_value('seth@seth.com').for(:email) }
    it { should_not allow_value('nope').for(:email) }
    it { should validate_presence_of :password_hash }
  end

  context "username" do
    it { should respond_to :username }
  end
end
