module LoginHelper
  def ensure_logged_out
    if page.has_link? 'LOGOUT'
      click_link 'LOGOUT'
    end
  end
  
  def ensure_logged_in
    @user = FactoryGirl.create(:user, id: 1)
    visit '/login'
    fill_in 'username', with: @user.name
    fill_in 'password', with: 'foobarbaz'
    click_button 'Login'
  end
end
