require 'spec_helper'

describe User do
  let(:test_user) { User.create(username: 'seth', password_hash: 'seth', email:'seth@seth.com')}
  it "should have a username" do
    test_user.username.should eq 'seth'
  end
end
