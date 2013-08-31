require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

  describe "#new" do
    it { should route(:get, '/users/new').to(action: :new) }
  end

  describe "#create" do
    it "redirects to the home page upon save" do
        post :create, user: attributes_for(:user)
        response.should redirect_to root_path
    end

    it "adds a user to the database" do
      expect { post :create, user: attributes_for(:user) }.to change {User.all.length}.by(1)
    end
  end

  describe "#show" do
    it "assigns an @user" do
      user = FactoryGirl.create(:user)
      get :show, {id: user.id}
      expect(assigns(:user)).to eq user
    end
  end

end
