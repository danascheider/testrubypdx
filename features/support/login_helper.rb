module LoginHelper
  def ensure_logged_out
    if page.has_link? 'LOGOUT'
      click_link 'LOGOUT'
    end
  end

  def create_user_through_gui
    visit '/users/new'
    fill_in 'user_name', with: 'foobarbaz'
    fill_in 'user_password', with: 'foobarbaz'
    fill_in 'user_password_confirmation', with: 'foobarbaz'
    fill_in 'user_email', with: 'foobar@baz.com'
    click_button 'Create User'

    User.last
  end

  def ensure_logged_in
    @user = create_user_through_gui
    visit '/login'
    fill_in 'username', with: @user.name
    fill_in 'password', with: 'foobarbaz'
    click_button 'Login'
  end
end
