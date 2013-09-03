require 'spec_helper'

feature 'user sessions' do
  let!(:user) { create(:user) }

  it "successfully displays the login form" do
    visit sign_in_path
    expect(page).to have_content "Login"
  end

  it "successfully signs in a user with valid info" do
    # REVIEW: user helper method
    visit sign_in_path
    fill_in 'session_username', with: user.username
    fill_in 'session_password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Success'
  end

  it "displays error message when user is logged in with invalid info" do
    visit sign_in_path
    fill_in 'session_username', with: 'notvalid'
    fill_in 'session_password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Login'
    expect(page).to have_content 'Error'
  end

  it "successfully logs out the user" do
    visit sign_in_path
    fill_in 'session_username', with: user.username
    fill_in 'session_password', with: 'password'
    click_button 'Login'
    visit root_path
    click_link('Logout')
    expect(page).to have_content 'Logged out successfully'
    expect(page).to have_content 'Login'
  end
end
