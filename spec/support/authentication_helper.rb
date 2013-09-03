module AuthenticationHelper
  def logout_user
    session.delete :user_id
  end
  def sign_in(user)
    visit sign_in_path
    fill_in 'session_username', with: user.username
    fill_in 'session_password', with: user.password
    click_button 'Login'
  end
end
