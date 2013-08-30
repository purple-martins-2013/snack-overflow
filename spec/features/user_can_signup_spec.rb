require 'spec_helper'

feature 'visiting the sign up page' do

  before do
    @user = FactoryGirl.create(:user)
  end

  it "successfully displays the form page" do
    visit new_user_path
    expect(page).to have_content "Sign up"
  end

  it "successfully creates a new user with valid info" do
    visit new_user_path
    fill_in 'user_username', with: "Capy"
    fill_in 'user_email', with: 'capy@bara.com'
    fill_in 'password', with: 'password'
    click_button 'Save User'
    expect(page).to have_content 'Logout'
  end

  it "displays the correct error message when a user is created without valid info" do
    visit new_user_path
    fill_in 'user_username', with: "Bara"
    fill_in 'user_email', with: 'invalid@email'
    fill_in 'password', with: 'password'
    click_button 'Save User'
    expect(page).to have_content 'Error'
    expect(page).to have_content 'Log In'
  end

end