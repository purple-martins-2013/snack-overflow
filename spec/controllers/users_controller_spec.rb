require 'spec_helper'

describe UsersController do
  describe "#creates" do
    it "redirects to the home page upon save" do
        post :create, user: attributes_for(:user)
        response.should redirect_to root_path
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
