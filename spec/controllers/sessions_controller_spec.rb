require 'spec_helper'

describe SessionsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:user_attrs) { {username: user.username, password: 'password'} }
  
  describe "#sign_in" do
    context 'given valid sign_in information' do

      it "assigns sessions[:user_id] to user's id" do
        post :create, user: user_attrs
        expect(session[:user_id]).to eq user.id
      end

      it 'redirects to root path' do
        post :create, user: user_attrs
        expect(response).to redirect_to :root
      end
    end

    context 'given invalid sign_in information' do
      it "does not assign sessions[:user_id] to user's id if wrong username" do
        post :create, user: { username: 'wrong', password: user_attrs[:password] }
        expect(session[:user_id]).to be_nil
      end

      it "does not assign session[:user_id] to user's id if wrong password" do
        post :create, user: { password: 'wrong', username: user_attrs[:username] }
        expect(session[:user_id]).to be_nil
      end

      it 'redirects to sign_in path' do
        post :create, user: { password: 'wrong', username: user_attrs[:username] }
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
