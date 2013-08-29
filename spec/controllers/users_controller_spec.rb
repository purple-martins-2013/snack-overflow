require 'spec_helper'

describe UsersController do
  describe "#creates" do
    it "redirects to the home page upon save" do
        post :create, user: attributes_for(:user)
        response.should redirect_to root_path
    end
  end

end
