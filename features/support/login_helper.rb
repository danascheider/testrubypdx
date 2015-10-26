module LoginHelper
  def ensure_logged_out
    if page.has_link? 'LOGOUT'
      click_link 'LOGOUT'
    end
  end
end
