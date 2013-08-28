require 'spec_helper'

describe User do
  let(:test_user) { FactoryGirl.create :user }

  context "validations" do
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :email }
    it { should allow_value('seth@seth.com').for(:email) }
    it { should_not allow_value('nope').for(:email) }
    it { should validate_presence_of :password }
  end

  context "username" do
    it { should respond_to :username }
  end

  context "email" do
    it { should respond_to :email }
  end

  context "password" do
    it { should respond_to :password }

    it "should be encrypted in the database" do
      user_password = 'password'
      test_user.reload
      test_user.password_digest.should_not eq user_password
    end
  end
end
